import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:x_wave/Bloc/FcmTokenBloc/fcm_token_states.dart';
import 'package:x_wave/Utils/NotificationServices/notification_services.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'dart:math' as math;

import '../../Bloc/FcmTokenBloc/fcm_token_bloc.dart';
import '../../Bloc/FcmTokenBloc/fcm_token_events.dart';

final localUserId = math.Random().nextInt(10000).toString();

class Zego extends StatefulWidget {
   Zego({super.key, required this.userId, required this.isVideo, required this.contact});

  final String userId;
  final bool isVideo;
  final String contact;


  @override
  State<Zego> createState() => _ZegoState();
}

class _ZegoState extends State<Zego> {

  final callController = ZegoUIKitPrebuiltCallController();

  IO.Socket? socketInstance;


  String callerId = "user_$localUserId";

  var fcmToken;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendNotification();
  }

  sendNotification(){
    Future.delayed(Duration(seconds: 2), (){NotificationServices().sendNotification(fcmToken, callerId, widget.isVideo, widget.contact);}).then((value){
      Fluttertoast.showToast(msg: "Sended successfully");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appID: 1718787180,
          appSign: 'a17764243793d332f97ee561c865bd247d9d77cc26310098eedf20c255a1a88a',
          userID: localUserId,
          callID: callerId,
          userName: 'user_$localUserId',
          controller: callController,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()..bottomMenuBarConfig.hideAutomatically = false..onOnlySelfInRoom = (val){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
