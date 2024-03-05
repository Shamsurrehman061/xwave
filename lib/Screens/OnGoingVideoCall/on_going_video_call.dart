
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:x_wave/Res/AppColors/app_colors.dart';

import '../../Controllers/CallingControllers/calling_controllers.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../Chat/chat.dart';


const appId = "8b896c0090924f688a6bbfbf6d20efc6";

class OnGoingVideoCallScreen extends StatefulWidget {
  OnGoingVideoCallScreen({super.key, required this.isVideoOn, this.url, this.channel, this.token});

  final bool isVideoOn;
  String? url;

  String? token;
  String? channel;


  @override
  State<OnGoingVideoCallScreen> createState() => _OnGoingVideoCallScreenState();
}

class _OnGoingVideoCallScreenState extends State<OnGoingVideoCallScreen> {


  void _settingModalBottomSheet(context){
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: AppColors.addCallBottomSheetColor,
        builder: (BuildContext bc){
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
              [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children:
                  [
                    Expanded(
                        flex:1,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                            child: SvgPicture.asset(AppIcons.callScreenDownButtonIcon))),
                    Expanded(
                        flex:4,
                        child: Center(child: Text("Add to Call", style: TextStyle(color: Colors.white, fontSize: 22.5),)),
                    ),
                    Expanded(
                        flex:1,
                        child: SvgPicture.asset(AppIcons.bottomSheetSearchIcon)),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Column(
                        children:
                        [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.borderColor, width: 2)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: AssetImage(AppImages.pic2),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.borderColor,
                                      border: Border.all(color: AppColors.tickBorderColor, width: 2),
                                  ),
                                  child: SvgPicture.asset(AppIcons.tickIcon),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: size.width * 0.20,
                              child: Text("Danish\n Tanveer", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.transparent, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Aleksandar \nGalimov", maxLines: 2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.borderColor, width: 2)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: AssetImage(AppImages.pic1),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.borderColor,
                                    border: Border.all(color: AppColors.tickBorderColor, width: 2),
                                  ),
                                  child: SvgPicture.asset(AppIcons.tickIcon),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Akeel \nBhai", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.transparent, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic3),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Alex \nBatti", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Column(
                        children:
                        [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.borderColor, width: 2)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: AssetImage(AppImages.pic2),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.borderColor,
                                    border: Border.all(color: AppColors.tickBorderColor, width: 2),
                                  ),
                                  child: SvgPicture.asset(AppIcons.tickIcon),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Danish\n Tanveer", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.transparent, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Aleksandar \nGalimov", maxLines: 2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.borderColor, width: 2)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: AssetImage(AppImages.pic1),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.borderColor,
                                    border: Border.all(color: AppColors.tickBorderColor, width: 2),
                                  ),
                                  child: SvgPicture.asset(AppIcons.tickIcon),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Akeel \nBhai", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.transparent, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic3),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Alex \nBatti", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Column(
                        children:
                        [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.borderColor, width: 2)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: AssetImage(AppImages.pic2),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.borderColor,
                                    border: Border.all(color: AppColors.tickBorderColor, width: 2),
                                  ),
                                  child: SvgPicture.asset(AppIcons.tickIcon),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Danish\n Tanveer", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.transparent, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Aleksandar \nGalimov", maxLines: 2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.borderColor, width: 2)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: AssetImage(AppImages.pic1),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.borderColor,
                                    border: Border.all(color: AppColors.tickBorderColor, width: 2),
                                  ),
                                  child: SvgPicture.asset(AppIcons.tickIcon),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Akeel \nBhai", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w400),)),
                        ],
                      ),
                      Column(
                        children:
                        [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.transparent, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic3),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: size.width * 0.20,
                              child: Text("Alex \nBatti", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, height: 1.2, fontSize: 13.sp, fontWeight: FontWeight.w300),)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          );
        }
    );
  }


  final callingController = CallingController();

  bool isMute = false;
  bool isOnSpeaker = false;
  bool isVideoOn = false;
  bool isMessageAvailable = false;



  // Future<void> initAgora() async {
  //
  //
  //   // retrieve permissions
  //   await [Permission.microphone, Permission.camera].request();
  //
  //   //create the engine
  //   _engine = createAgoraRtcEngine();
  //   await _engine.initialize(const RtcEngineContext(
  //     appId: appId,
  //     channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
  //   ));
  //
  //
  //   await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  //   var configuration = VideoEncoderConfiguration(
  //     dimensions: VideoDimensions(width: 1920, height: 1080),
  //   );
  //   await _engine .setVideoEncoderConfiguration(configuration);
  //   await _engine.enableVideo();
  //   await _engine.startPreview();
  //
  //   await _engine.joinChannel(
  //     token: "007eJxTYPh1/1NRckBhdMxSm4sz5DZl8mTzX4g4FmhY4f/2H/ci4bUKDBZJFpZmyQYGlgaWRiZpZhYWiWZJSWlJaWYpRgapaclmK3O7UhsCGRl6c1lYGBkgEMRnYShJLS5hYAAAXDUfZQ==",
  //     channelId: "test",
  //     uid: 0,
  //     options: const ChannelMediaOptions(),
  //   );
  //
  //
  //   _engine.registerEventHandler(
  //     RtcEngineEventHandler(
  //       onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
  //         print("succccccccessssssssssssssssssssssssssss**************************************************************************************************************************************************************************************************************");
  //         debugPrint("local user ${connection.localUid} joined");
  //         setState(() {
  //           _localUserJoined = true;
  //         });
  //       },
  //       onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
  //         debugPrint("remote user $remoteUid joined");
  //         setState(() {
  //           _remoteUid = remoteUid;
  //         });
  //       },
  //       onUserOffline: (RtcConnection connection, int remoteUid,
  //           UserOfflineReasonType reason) {
  //         debugPrint("remote user $remoteUid left channel");
  //         setState(() {
  //           _remoteUid = null;
  //         });
  //       },
  //       onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
  //         debugPrint(
  //             '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
  //       },
  //     ),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initAgora();
    print("channel ***************************************** ${widget.channel}");
    callingController.setCallStatus(false);
    isVideoOn = widget.isVideoOn;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _dispose();
  // }
  //
  // Future<void> _dispose() async {
  //   await _engine.leaveChannel();
  //   await _engine.release();
  // }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Text("someone is calling you", style: TextStyle(color: Colors.white),),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: SafeArea(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: isVideoOn ? Colors.transparent : AppColors.popUpMenuButton,
    //       ),
    //       child: Stack(
    //         children:
    //         [
    //           Positioned(
    //             bottom: 0,
    //             top: 0,
    //             left: 0,
    //             right: 0,
    //             child: isVideoOn ? Image.asset(AppImages.srk,fit: BoxFit.cover,) : Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children:
    //               [
    //                 CircleAvatar(
    //                   radius: size.height * 0.08,
    //                   backgroundImage: NetworkImage(widget.url!),
    //                 ),
    //                 SizedBox(
    //                   height: size.height * 0.03,
    //                 ),
    //                 Text("Elon Musk", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),),
    //                 Text("04:28", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18),),
    //               ],
    //             ),
    //           ),
    //           Column(
    //             children:
    //             [
    //               Expanded(
    //                 flex: 2,
    //                 child: Row(
    //                   children:
    //                   [
    //                     Expanded(
    //                         flex:2,
    //                         child: InkWell(
    //                           onTap: (){
    //                             print(" Before *************** ${callingController.getVideoStatus()}");
    //                             callingController.setCallStatus(!callingController.getVideoStatus());
    //                             Get.back();
    //                             print(" After *************** ${callingController.getVideoStatus()}");
    //                           },
    //                             child: SvgPicture.asset(AppIcons.callScreenDownButtonIcon))),
    //                     Expanded(
    //                       flex: 4,
    //                       child: isVideoOn ? Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children:
    //                         [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children:
    //                             [
    //                               SvgPicture.asset(AppIcons.callScreenLockIcon),
    //                               SizedBox(
    //                                 width: 5,
    //                               ),
    //                               Text("SRK BHAI", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
    //                             ],
    //                           ),
    //                           Text("09:58", style: TextStyle(color: Colors.white),),
    //                         ],
    //                       ) : Container(),
    //                     ),
    //                     Expanded(
    //                         flex:1,
    //                         child:isVideoOn ? SvgPicture.asset(AppIcons.callScreenPicInPicIcon) : Container()),
    //                     Expanded(
    //                       flex:1,
    //                       child: PopupMenuButton(
    //                         padding: EdgeInsets.all(0),
    //                         icon: SvgPicture.asset(AppIcons.callScreenMoreIcon),
    //                         color: AppColors.popUpMenuButton,
    //                         position: PopupMenuPosition.under,
    //                         itemBuilder: (context) => <PopupMenuItem<String>>
    //                         [
    //                           PopupMenuItem<String>(
    //                             value: 'group',
    //                             enabled: true,
    //                             padding: EdgeInsets.only(right: 80.0, left: 15.0),
    //                             child: Row(
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               children:
    //                               [
    //                                 SvgPicture.asset(AppIcons.callScreenSpeakerIcon, color: Colors.white, fit: BoxFit.cover, height: 20.0,),
    //                                 SizedBox(
    //                                   width: size.width * 0.05,
    //                                 ),
    //                                 Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   children:
    //                                   [
    //                                     Text("Audio",style: TextStyle(color: Colors.white, fontSize: 18.0),),
    //                                     Text("Speaker",style: TextStyle(color: Color(0xff7D8E98), fontSize: 15.0),),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           PopupMenuItem<String>(
    //                             value: 'group',
    //                             enabled: true,
    //                             onTap: (){
    //                               _settingModalBottomSheet(context);
    //                             },
    //                             padding: EdgeInsets.only(right: 80.0, left: 15.0),
    //                             child: Row(
    //                               children: [
    //                                 SvgPicture.asset(AppIcons.videoCallScreenAddCallIcon, color: Colors.white, height: 20.0,),
    //                                 SizedBox(
    //                                   width: size.width * 0.05,
    //                                 ),
    //                                 Text("Add to Call",style: TextStyle(color: Colors.white, fontSize: 18.0),),
    //                               ],
    //                             ),
    //                           ),
    //                           PopupMenuItem<String>(
    //                             value: 'group',
    //                             enabled: true,
    //                             onTap: (){
    //                               Get.back();
    //
    //                             },
    //                             padding: EdgeInsets.only(right: 80.0, left: 15.0),
    //                             child: Row(
    //                               children: [
    //                                 SvgPicture.asset(AppIcons.callScreenEndCallIcon, color: Color(0xffFF7575),height: 12.5,),
    //                                 SizedBox(
    //                                   width: size.width * 0.03,
    //                                 ),
    //                                 Text("End Call",style: TextStyle(color: Color(0xffFF7575), fontSize: 18.0),),
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                 flex: 15,
    //                 child: Padding(
    //                   padding: EdgeInsets.only(right: 15.0),
    //                   child: _localUserJoined ? Align(
    //                       alignment: Alignment.topRight,
    //                       child: _localUserJoined ? AgoraVideoView(
    //                         controller: VideoViewController(
    //                           rtcEngine: _engine,
    //                           canvas: const VideoCanvas(uid: 1),
    //                         ),
    //                       )  : Container(child: Text("hello", style: TextStyle(color: Colors.white),),)) : Container(),
    //                   // child: _localUserJoined ? Align(
    //                   //     alignment: Alignment.topRight,
    //                   //     child: isVideoOn ?  Stack(
    //                   //       children:
    //                   //       [
    //                   //         ClipRRect(
    //                   //             borderRadius: BorderRadius.circular(10.0),
    //                   //             child: Image.asset(AppImages.nature, width: 100, height: 150, fit: BoxFit.cover,)),
    //                   //         Positioned(
    //                   //             bottom: 0,
    //                   //             left: 0,
    //                   //             child: Padding(
    //                   //                 padding: EdgeInsets.only(left: 10, bottom: 10),
    //                   //                 child: SvgPicture.asset(AppIcons.callScreenMicIcon))
    //                   //         ),
    //                   //       ],
    //                   //     ) : Container()) : Container(),
    //                 ),
    //               ),
    //
    //               Expanded(
    //                 flex: 3,
    //                 child: Align(
    //                   alignment: Alignment.topLeft,
    //                   child: SingleChildScrollView(
    //                     scrollDirection: Axis.horizontal,
    //                     child: Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Container(
    //                             height: size.height * 0.18,
    //                             width: size.width * 0.25,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10.0),
    //                               border: Border.all(color: AppColors.orangeColor),
    //                               color: AppColors.popUpMenuButton,
    //                             ),
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               crossAxisAlignment: CrossAxisAlignment.center,
    //                               children: [
    //                                 CircleAvatar(
    //                                   backgroundImage: AssetImage(AppImages.pic2),
    //                                 ),
    //                                 SizedBox(
    //                                   height: size.height * 0.01,
    //                                 ),
    //                                 Row(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   children:
    //                                   [
    //                                     SvgPicture.asset(AppIcons.callScreenMicIcon),
    //                                     SizedBox(
    //                                       width: 5.0,
    //                                     ),
    //                                     SizedBox(
    //                                       width: size.width * 0.15,
    //                                         child: Text("Khalid",overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp, color: Colors.white),)),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: size.width * 0.02,
    //                           ),
    //                           Container(
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10.0),
    //                               border: Border.all(color: AppColors.orangeColor),
    //                               color: AppColors.popUpMenuButton,
    //                             ),
    //                             child: Stack(
    //                               children:
    //                               [
    //                                 ClipRRect(
    //                                     borderRadius: BorderRadius.circular(10.0),
    //                                     child: Image.asset(AppImages.nature, width: 100, height: 200, fit: BoxFit.cover,)),
    //                                 Positioned(
    //                                     bottom: 0,
    //                                     left: 0,
    //                                     child: Padding(
    //                                       padding: EdgeInsets.only(left: 10, bottom: 10),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         children:
    //                                         [
    //                                           SvgPicture.asset(AppIcons.callScreenMicIcon),
    //                                           SizedBox(
    //                                             width: 5.0,
    //                                           ),
    //                                           SizedBox(
    //                                               width: size.width * 0.15,
    //                                               child: Text("Khalid",overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp, color: Colors.white),)),
    //                                         ],
    //                                       ),
    //                                     )
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: size.width * 0.02,
    //                           ),
    //                           Container(
    //                             height: size.height * 0.18,
    //                             width: size.width * 0.25,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10.0),
    //                               color: AppColors.popUpMenuButton,
    //                               border: Border.all(color: AppColors.orangeColor),
    //                             ),
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               crossAxisAlignment: CrossAxisAlignment.center,
    //                               children: [
    //                                 CircleAvatar(
    //                                   backgroundImage: AssetImage(AppImages.pic4),
    //                                 ),
    //                                 SizedBox(
    //                                   height: size.height * 0.01,
    //                                 ),
    //                                 Row(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   children:
    //                                   [
    //                                     SvgPicture.asset(AppIcons.callScreenMicIcon),
    //
    //                                     SizedBox(
    //                                       width: 5.0,
    //                                     ),
    //
    //                                     SizedBox(
    //                                         width: size.width * 0.15,
    //                                         child: Text("Rahman", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp, color: Colors.white),)),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: size.height * 0.015,
    //               ),
    //               Expanded(
    //                 flex: 3,
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     color: AppColors.callingButtonBackground,
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: AppColors.callingButtonBackground,
    //                         offset: Offset(0,1),
    //                         spreadRadius: 10.0,
    //                         blurRadius: 10.0,
    //                       ),
    //                     ],
    //                   ),
    //                   child: Padding(
    //                     padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    //                     child: Padding(
    //                       padding: EdgeInsets.only(bottom: size.height * 0.02),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children:
    //                         [
    //                           InkWell(
    //                             onTap: (){
    //                               setState(() {
    //                                 isMute = !isMute;
    //                               });
    //                             },
    //                             child: Container(
    //                               padding: EdgeInsets.all(20),
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: isMute ? AppColors.callScreenVideoMessageButtonColor : AppColors.addMemberColor.withOpacity(0.2),
    //                               ),
    //                               child: SvgPicture.asset(AppIcons.chatScreenMicIcon,color: Colors.white, fit: BoxFit.cover, width: 18,),
    //                             ),
    //                           ),
    //                           InkWell(
    //                             onTap: (){
    //                               setState(() {
    //                                 isOnSpeaker = !isOnSpeaker;
    //                               });
    //                             },
    //                             child: Container(
    //                               padding: EdgeInsets.all(18),
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: isOnSpeaker ? AppColors.callScreenVideoMessageButtonColor : AppColors.addMemberColor.withOpacity(0.2),
    //                               ),
    //                               child: SvgPicture.asset(AppIcons.videoCallScreenSpeaker2Icon,color: Colors.white, fit: BoxFit.cover, width: 25,),
    //                             ),
    //                           ),
    //                           InkWell(
    //                             onTap: ()async{
    //                               await _engine.enableVideo();
    //                               // setState(() {
    //                               //   isVideoOn = !isVideoOn;
    //                               // });
    //                             },
    //                             child: Container(
    //                               padding: EdgeInsets.all(19.5),
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: isVideoOn ? AppColors.callScreenVideoMessageButtonColor : AppColors.addMemberColor.withOpacity(0.2),
    //                               ),
    //                               child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon,color: Colors.white, fit: BoxFit.cover, width: 25,),
    //                             ),
    //                           ),
    //                           InkWell(
    //                             onTap: (){
    //                               setState(() {
    //                                 isMessageAvailable = !isMessageAvailable;
    //                               });
    //                               callingController.setCallStatus(!callingController.dropVideoScreen.value);
    //                               print(callingController.dropVideoScreen);
    //                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Chat()));
    //                               //Get.back();
    //
    //                             },
    //                             child: Container(
    //                               padding: EdgeInsets.all(16),
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: isMessageAvailable ? AppColors.callScreenVideoMessageButtonColor : AppColors.addMemberColor.withOpacity(0.2),
    //                               ),
    //                               child: SvgPicture.asset(AppIcons.videoCallScreenMessageIcon,color: Colors.white, fit: BoxFit.cover, width: 25,),
    //                             ),
    //                           ),
    //                           InkWell(
    //                             onTap: (){
    //                               Get.back();
    //                             },
    //                             child: Container(
    //                               padding: EdgeInsets.all(20),
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: AppColors.crossIconBackgroundColor,
    //                               ),
    //                               child: SvgPicture.asset(AppIcons.videoCallScreenCrossIcon,color: Colors.white, fit: BoxFit.cover, width: 15,),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
