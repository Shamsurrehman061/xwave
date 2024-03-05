

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swipe_to/swipe_to.dart';

import '../../Res/IconsUrl/icons.dart';
import '../Zego/accepting_zego.dart';
import '../Zego/zego.dart';








class CallInvitation extends StatefulWidget {

  const CallInvitation({super.key, required this.imageUrl, required this.callerId});

  final String imageUrl;
  final String callerId;



  @override
  _CallInvitationState createState() => _CallInvitationState();
}

class _CallInvitationState extends State<CallInvitation>{

  Timer? timer;


  int count = 0;
  @override
  void initState() {
    super.initState();
    playSound();
    setValue();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(count == 30)
        {
          Get.back();
        }
      else
        {
          count +=1;
        }
    });
  }


  playSound()
  {
    FlutterRingtonePlayer.play(
      android: AndroidSounds.ringtone,
      ios: IosSounds.glass,
      looping: true, // Android only - API >= 28
      volume: 0.5, // Android only - API >= 28
      asAlarm: true, // Android only - all APIs
    );
  }


  bool first = true;
  bool second = false;
  bool third = false;

  setValue()
  {
    // Timer.periodic(Duration(milliseconds: 500), (timer) {
    //
    //   if(first)
    //     {
    //       setState(() {
    //         second = true;
    //         first = false;
    //       });
    //     }
    //   else if(second)
    //     {
    //       setState(() {
    //         third = true;
    //         second = false;
    //       });
    //     }
    //   else if(third)
    //     {
    //       setState(() {
    //         third = false;
    //         first = true;
    //       });
    //     }

    // });
  }


  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
    FlutterRingtonePlayer.stop();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(),
            // ),
            Text(
              "Incoming Call",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 50),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SwipeTo(
                  onRightSwipe: (value){
                    FlutterRingtonePlayer.stop();
                    //Get.to(AcceptingZego(userId: widget.callerId, isVideo: false,));
                  },
                  offsetDx: 1.5,
                  swipeSensitivity: 5,
                  rightSwipeWidget: Container(),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: SvgPicture.asset(AppIcons.userProfileScreenCallIcon, fit: BoxFit.cover, height: 30,),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: first ? Colors.white : Colors.grey,  size: 20,),
                Icon(Icons.arrow_forward_ios, color: second ? Colors.white : Colors.grey,  size: 20,),
                Icon(Icons.arrow_forward_ios, color: third ? Colors.white : Colors.grey,  size: 20,),


                Icon(Icons.arrow_back_ios_new, color: third ? Colors.white : Colors.grey, size: 20,),
                Icon(Icons.arrow_back_ios_new, color: second ? Colors.white : Colors.grey, size: 20,),
                Icon(Icons.arrow_back_ios_new, color: first ? Colors.white : Colors.grey, size: 20,),
                SwipeTo(
                    onLeftSwipe: (value){
                      FlutterRingtonePlayer.stop();
                      Get.back();
                    },
                    leftSwipeWidget: Container(),
                    offsetDx: 1.5,
                    swipeSensitivity: 5,
                    child: Container(
                      padding: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: SvgPicture.asset(AppIcons.callScreenEndCallIcon, fit: BoxFit.cover, height: 20, color: Colors.red,),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
