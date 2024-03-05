import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'dart:math' as math;

final localUserId = math.Random().nextInt(10000).toString();

class AcceptingZego extends StatefulWidget {
  AcceptingZego({super.key, required this.isVideo, required this.callerId});

  final String callerId;
  final bool isVideo;
  @override
  State<AcceptingZego> createState() => _AcceptingZegoState();
}

class _AcceptingZegoState extends State<AcceptingZego> {

  final callController = ZegoUIKitPrebuiltCallController();


  String username = "user_$localUserId";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appID: 1718787180,
          appSign: 'a17764243793d332f97ee561c865bd247d9d77cc26310098eedf20c255a1a88a',
          userID: localUserId,
          callID: widget.callerId,
          userName: username,
          controller: callController,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()..bottomMenuBarConfig.hideAutomatically = false..onOnlySelfInRoom = (val){
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
