import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../Utils/NotificationServices/notification_services.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;

class CheckingCalling extends StatefulWidget {
  const CheckingCalling({super.key});

  @override
  State<CheckingCalling> createState() => _CheckingCallingState();
}

class _CheckingCallingState extends State<CheckingCalling> {

  NotificationServices notificationServices = NotificationServices();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var token;
  getFcmToken()async
  {
    token = await messaging.getToken();
    print(token);
  }


  initializeNotification()async
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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.initialize();
    notificationServices.listenNotification(context);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                MaterialButton(onPressed: (){
                  getFcmToken();
                }, child: Text("Get Token"),),


                MaterialButton(onPressed: (){
                  notificationServices.sendNotification(token, "123", false, "03149761371");
                }, child: Text("Push Notification"),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
