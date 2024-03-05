


import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:x_wave/Screens/HomeScreen/home_screen.dart';
import 'package:http/http.dart' as http;

import '../../Screens/Zego/accepting_zego.dart';
import '../../Screens/jj.dart';

class NotificationServices{



  FirebaseMessaging messaging = FirebaseMessaging.instance;



  void requestNotificationPermission() async {

    final notiPermission = await Permission.notification.request();

    if(notiPermission.isDenied)
      {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      }

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true ,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  initialize()async
  {
    await AwesomeNotifications().initialize(
        null, //'resource://drawable/res_app_icon',//
        [
          NotificationChannel(
            channelKey: 'call_channel',
            channelName: 'Call Channel',
            channelDescription: 'Channel of Calling',
            playSound: true,
            onlyAlertOnce: true,
            channelShowBadge: true,
            locked: true,
            defaultRingtoneType: DefaultRingtoneType.Ringtone,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.Max,
            defaultPrivacy: NotificationPrivacy.Private,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          )
        ],
        debug: true);
  }

  listenNotification(BuildContext context)
  {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      final details = message.data;
      final isVideo = details['isVideo'];
      final callerId = details['callerId'];
      final userContact = details['contact'];

      print(isVideo);

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 123,
          channelKey: "call_channel",
          color: Colors.white,
          body: isVideo == "true" ? 'Incoming video call' : 'Incoming audio call',
          title: userContact,
          category: NotificationCategory.Call,
          wakeUpScreen: true,
          fullScreenIntent: true,
          autoDismissible: false,
        ),
        actionButtons:
        [
          NotificationActionButton(key: "ACCEPT", label: "ACCEPT CALL", autoDismissible: true, color: Colors.green),
          NotificationActionButton(key: "REJECT", label: "REJECT CALL", autoDismissible: true, color: Colors.green),
        ],
      );



      AwesomeNotifications().setListeners(
        onActionReceivedMethod: (ReceivedAction receivedAction){
          return onActionReceivedMethod(receivedAction, context, isVideo == "true" ? true : false, callerId);
        },
      );

    });
  }


  createNotification(RemoteMessage message)
  {
    final details = message.data;
    final isVideo = details['isVideo'];
    final callerId = details['callerId'];
    final userContact = details['contact'];

    print(isVideo);
    // AwesomeNotifications().createNotification(
    //     content: NotificationContent(
    //       id: 123,
    //       channelKey: "call_channel",
    //       color: Colors.white,
    //       body: isVideo ? 'Incoming video call' : 'Incoming audio call',
    //       title: userContact,
    //       category: NotificationCategory.Call,
    //       wakeUpScreen: true,
    //       fullScreenIntent: true,
    //       autoDismissible: true,
    //     ),
    //     actionButtons: [
    //       NotificationActionButton(key: "ACCEPT", label: "ACCEPT CALL", autoDismissible: true, color: Colors.green),
    //       NotificationActionButton(key: "REJECT", label: "REJECT CALL", autoDismissible: true, color: Colors.green),
    //     ]
    // );

    // AwesomeNotifications().setListeners(
    //   onActionReceivedMethod: (ReceivedAction receivedAction){
    //     return onActionReceivedMethod(receivedAction, context, isVideo, callerId);
    //   },
    // );
  }

   getFcmToken()async
  {
    return await messaging.getToken();
  }


  sendNotification(var token, var callerId, bool isVideo, var userContact)async
  {

    try{
      http.Response response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "key=AAAAtP79mHA:APA91bHjtDOGKH6nfgMYpWT2GCkJi5Y4-fVHoZDcfZVNoYHUjSOwtyZC7KH61U8pvRtegoDrxwEVyKRI-C0FmXp2gQIjI30elCydckGQHUjbjs1zO8zOUL9Tu-n1vdgrcnC8TuZ2QRR4"
        },
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            'body': isVideo ? 'Incoming video call' : 'Incoming audio call',
            'title': userContact,
          },
          'priority' : 'high',
          'data': <String, dynamic>{
            'click_action' : 'FLUTTER_NOTIFICATION_CLICK',
            'id': 1,
            'status': 'done',
            'isVideo': isVideo,
            'callerId': callerId
          },
          'to': '$token',
        }),
      );


      print(response.statusCode);
      print(response.body);
    }
    catch(e)
    {
      print(e);
    }


  }


  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction, context, var isVideo, var callerId) async {
    // Your code goes here
    if(receivedAction.buttonKeyPressed == "REJECT") {
      // Navigator.of(context).pop();
      // AwesomeNotifications().dismiss(receivedAction.id!);
      print("rejected");
    }
    else
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AcceptingZego(isVideo: isVideo, callerId: callerId,)));
      }
    // Navigate into pages, avoiding to open the notification details page over another details page already opened

  }

}