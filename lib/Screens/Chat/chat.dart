import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bubble/bubble.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:video_player/video_player.dart';
import 'package:x_wave/Utils/NotificationServices/notification_services.dart';

import '../../Bloc/FcmTokenBloc/fcm_token_bloc.dart';
import '../../Bloc/FcmTokenBloc/fcm_token_events.dart';
import '../../Bloc/FcmTokenBloc/fcm_token_states.dart';
import '../../Controllers/CallingControllers/calling_controllers.dart';
import '../../Controllers/ChatController/audio_controller.dart';
import '../../Controllers/ChatController/chat_controller.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';

import '../../Utils/ThemeManagement/theme_management.dart';
import '../../Utils/Widget/play_video.dart';
import '../CallScreen2/call_screen_2.dart';
import '../OnGoingVideoCall/on_going_video_call.dart';
import '../UserProfile/user_profile_screen.dart';
import '../Zego/zego.dart';


class Chat extends StatefulWidget {
   Chat({super.key, this.userId, required this.userContact});
  String? userId;
  String? userContact;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ThemeManager themeManager = ThemeManager();

  static var styleMe = BubbleStyle(
    nip: BubbleNip.rightBottom,
    color: AppColors.orangeColor,
    elevation: 0,
    padding: BubbleEdges.only(left: 10, right: 5, top: 5),
    radius: Radius.circular(8.0),
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );
  static var styleMeContinue = BubbleStyle(
    color: AppColors.orangeColor,
    elevation: 0,
    padding: BubbleEdges.only(left: 10, right: 5, top: 5),
    radius: Radius.circular(8.0),
    margin: BubbleEdges.only(top: 0, left: 50),
    alignment: Alignment.topRight,
  );
  static var styleMeContinueReply = BubbleStyle(
    nip: BubbleNip.rightBottom,
    color: AppColors.orangeColor,
    elevation: 0,
    padding: BubbleEdges.only(left: 0, right: 0, top: 0),
    radius: Radius.circular(8.0),
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );
  static var styleSomebody = BubbleStyle(
    nip: BubbleNip.leftBottom,
    color: AppColors.textFieldColor,
    elevation: 0,
    padding: BubbleEdges.only(left: 10, right: 5, top: 5),
    radius: Radius.circular(8.0),
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  final id1 = "1000";
  final id2 = "2000";
  final id3 = "3000";
  final id4 = "4000";
  final id5 = "5000";

  final user1 = "2211";
  final user2 = "1122";
  bool isReply = false;

  static var styleSomebodyContinue = BubbleStyle(
    nip: BubbleNip.no,
    color: AppColors.textFieldColor,
    elevation: 0,
    padding: BubbleEdges.only(left: 10, right: 5, top: 5),
    radius: Radius.circular(8.0),
    margin: BubbleEdges.only(top: 0, right: 50),
    alignment: Alignment.topLeft,
  );
  final keyboardController = KeyboardVisibilityController();
  final callingController = CallingController();
  bool emojiShowing = false;
  bool keyboardEnable = true;
  String text = "Japan looks amazing!Japan looks amazing?Japan looks";
  String text3 = "Japan looks";
  String text2 = "Japan looks amazing!Japan looks amazing?Japan looks Japan looks amazing!Japan looks amazing?Japan looks Japan looks amazing!Japan looks amazing?Japan looks";
  String text1 = "Japan looks";
  final messageController = TextEditingController();
  void _settingModalBottomSheet(context){
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0),)
        ),
        backgroundColor: themeManager.darkTheme ? AppColors.darkModeBlackColor : Colors.white,
        builder: (BuildContext bc){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children:
            [
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  Column(
                    children:
                    [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppIcons.bottomSheetMediaIcon, fit: BoxFit.cover, height: size.height * 0.04,),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("Media", style: TextStyle(color:themeManager.darkTheme ? Colors.white : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Column(
                    children:
                    [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppIcons.bottomSheetDocumentIcon, fit: BoxFit.cover, height: size.height * 0.04,),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("Document", style: TextStyle(color:themeManager.darkTheme ? Colors.white : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Column(
                    children:
                    [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppIcons.bottomSheetCameraIcon, fit: BoxFit.cover, height: size.height * 0.04,),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("Camera", style: TextStyle(color:themeManager.darkTheme ? Colors.white : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  Column(
                    children:
                    [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppIcons.bottomSheetContactsIcon, fit: BoxFit.cover, height: size.height * 0.04,),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("Contacts", style: TextStyle(color:themeManager.darkTheme ? Colors.white : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Column(
                    children:
                    [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppIcons.bottomSheetContactsIcon, fit: BoxFit.cover, height: size.height * 0.04,),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("Location", style: TextStyle(color:themeManager.darkTheme ? Colors.white : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Column(
                    children:
                    [
                      Container(
                        padding: EdgeInsets.all(26.0),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppIcons.bottomSheetGifIcon, fit: BoxFit.cover, height: size.height * 0.015,),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("GIF", style: TextStyle(color:themeManager.darkTheme ? Colors.white : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),



                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          );
        }
    );
  }



  void _showImageSourceBottomSheet(BuildContext context) {
    final controller = Get.put(ChatController());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  controller.getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  controller.getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Video'),
                onTap: () {
                  controller.getVideo(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  final focusNode = FocusNode();

  _onBackspacePressed() {
    messageController
      ..text = messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messageController.text.length));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyboardController.onChange.listen((event) {
      setState(() {
        keyboardEnable = event;
      });
    });
  }

  bool showContent = true;
  double sliderVal = 0.0;

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }



  @override
  Widget build(BuildContext context){
    ChatController chatController = Get.put(ChatController());
    ChatAudioController audioPlayerController = Get.put(ChatAudioController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children:
              [
                Container(
                  color: AppColors.popUpMenuButton,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back),
                            color: AppColors.orangeColor,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileScreen()));
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: AssetImage(AppImages.pic2),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                  [
                                    Text("Alex Linderson", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15.sp,),),

                                    Row(
                                      children:
                                      [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.onlineDotGreenColor,
                                              border: Border.all(color: AppColors.onlineDotBorderColor, width: 1)
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Active now", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.w400, fontSize: 12.sp,),),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [

                          InkWell(
                              onTap: (){
                                FcmTokenBloc().add(GetFcmToken());
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Zego(userId: widget.userId!, isVideo: false, contact: widget.userContact!,)));
                              },
                              child: SvgPicture.asset(AppIcons.userProfileScreenCallIcon, color: AppColors.orangeColor, fit: BoxFit.cover, height: size.height * 0.025,)),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.055),
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon, color: AppColors.orangeColor, fit: BoxFit.cover, height: size.height * 0.02,)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child:
                //   StreamBuilder(
                //     stream: userMessages.box!.watch(),
                //     builder: (context, AsyncSnapshot<BoxEvent> snapshot){
                //       var messages = Hive.box<OfflineMessageModel>("Messages").values.where((element) => element.chatId == id1).toList();
                //
                //       return ListView.builder(
                //         itemCount: messages.length,
                //         physics: BouncingScrollPhysics(),
                //         shrinkWrap: true,
                //         itemBuilder: (context,int index){
                //           var msg = messages[index];
                //
                //           if(index == 0)
                //           {
                //             if(msg.userId == "1122")
                //             {
                //               if(msg.messageType == MessageType.text)
                //               {
                //                 return Column(
                //                   children: [
                //                     SizedBox(
                //                       height: size.height * 0.04,
                //                     ),
                //                     Container(
                //                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                //                       decoration: BoxDecoration(
                //                         color: AppColors.chatTimeLabelColor,
                //                         borderRadius: BorderRadius.circular(6.0),
                //                       ),
                //                       child: Text("25 January 2023", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),),
                //                     ),
                //                     // Dismissible(
                //                     //   key: UniqueKey(),
                //                     //   confirmDismiss: (a) async {
                //                     //
                //                     //
                //                     //     chatController.setReply(true);
                //                     //     FocusScope.of(context).requestFocus(
                //                     //         focusNode);
                //                     //   },
                //                     //
                //                     //   direction: DismissDirection.startToEnd,
                //                     //   child: Padding(
                //                     //     padding: EdgeInsets.symmetric(
                //                     //         vertical: size.height * 0.002),
                //                     //     child: msg.textMessage.length > 30 ? Bubble(
                //                     //       style: styleMe,
                //                     //       child: Column(
                //                     //         mainAxisSize: MainAxisSize.min,
                //                     //         children:
                //                     //         [
                //                     //           Padding(
                //                     //               padding: EdgeInsets.only(
                //                     //                   right: 5),
                //                     //               child: Container(
                //                     //                   constraints: BoxConstraints(
                //                     //                     maxWidth: 300.0,
                //                     //                   ),
                //                     //                   child: Text(msg.textMessage,
                //                     //                     style: TextStyle(
                //                     //                         color: Colors.black,
                //                     //                         fontSize: 16.sp),))),
                //                     //           Align(
                //                     //             alignment: Alignment.topRight,
                //                     //             child: SizedBox(
                //                     //               width: size.width * 0.19,
                //                     //               child: Row(
                //                     //                 mainAxisSize: MainAxisSize
                //                     //                     .min,
                //                     //                 children:
                //                     //                 [
                //                     //                   Text("12:00 am",
                //                     //                     style: TextStyle(
                //                     //                         color: AppColors
                //                     //                             .timeStampColor,
                //                     //                         fontSize: 11.sp),),
                //                     //                   SizedBox(
                //                     //                     width: 3.0,
                //                     //                   ),
                //                     //                   Icon(Icons.done_all,
                //                     //                     color: AppColors
                //                     //                         .tickColorInDarkMode,
                //                     //                     size: 13.0,),
                //                     //                 ],
                //                     //               ),
                //                     //             ),
                //                     //           ),
                //                     //         ],
                //                     //       ),
                //                     //     ) : Bubble(
                //                     //       style: styleMe,
                //                     //       child: Row(
                //                     //         mainAxisSize: MainAxisSize.min,
                //                     //         children:
                //                     //         [
                //                     //           Padding(
                //                     //               padding: EdgeInsets.only(
                //                     //                   right: 5),
                //                     //               child: Container(
                //                     //                   constraints: BoxConstraints(
                //                     //                     maxWidth: 300.0,
                //                     //                   ),
                //                     //                   child: Text(msg.textMessage,
                //                     //                     style: TextStyle(
                //                     //                         color: Colors.black,
                //                     //                         fontSize: 16.sp),))),
                //                     //           Padding(
                //                     //             padding: EdgeInsets.only(
                //                     //                 top: 12.0),
                //                     //             child: SizedBox(
                //                     //               width: size.width * 0.19,
                //                     //               child: Row(
                //                     //                 mainAxisSize: MainAxisSize
                //                     //                     .min,
                //                     //                 children:
                //                     //                 [
                //                     //                   Text("12:00 am",
                //                     //                     style: TextStyle(
                //                     //                         color: AppColors
                //                     //                             .timeStampColor,
                //                     //                         fontSize: 11.sp),),
                //                     //                   SizedBox(
                //                     //                     width: 3.0,
                //                     //                   ),
                //                     //                   Icon(Icons.done_all,
                //                     //                     color: AppColors
                //                     //                         .tickColorInDarkMode,
                //                     //                     size: 13.0,),
                //                     //                 ],
                //                     //               ),
                //                     //             ),
                //                     //           ),
                //                     //         ],
                //                     //       ),
                //                     //     ),
                //                     //   ),
                //                     // ),
                //
                //                     SwipeTo(
                //                       onRightSwipe:(value){
                //                         chatController.setReply(true);
                //                         Future.delayed(const Duration(milliseconds: 200), () => FocusScope.of(context).requestFocus(focusNode));
                //                       },
                //                       child: Padding(
                //                         padding: EdgeInsets.symmetric(
                //                             vertical: size.height * 0.002),
                //                         child: msg.textMessage.length > 30 ? Bubble(
                //                           style: styleMe,
                //                           child: Column(
                //                             mainAxisSize: MainAxisSize.min,
                //                             children:
                //                             [
                //                               Padding(
                //                                   padding: EdgeInsets.only(
                //                                       right: 5),
                //                                   child: Container(
                //                                       constraints: BoxConstraints(
                //                                         maxWidth: 300.0,
                //                                       ),
                //                                       child: Text(msg.textMessage,
                //                                         style: TextStyle(
                //                                             color: Colors.black,
                //                                             fontSize: 16.sp),))),
                //                               Align(
                //                                 alignment: Alignment.topRight,
                //                                 child: SizedBox(
                //                                   width: size.width * 0.19,
                //                                   child: Row(
                //                                     mainAxisSize: MainAxisSize
                //                                         .min,
                //                                     children:
                //                                     [
                //                                       Text("12:00 am",
                //                                         style: TextStyle(
                //                                             color: AppColors
                //                                                 .timeStampColor,
                //                                             fontSize: 11.sp),),
                //                                       SizedBox(
                //                                         width: 3.0,
                //                                       ),
                //                                       Icon(Icons.done_all,
                //                                         color: AppColors
                //                                             .tickColorInDarkMode,
                //                                         size: 13.0,),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ) : Bubble(
                //                           style: styleMe,
                //                           child: Row(
                //                             mainAxisSize: MainAxisSize.min,
                //                             children:
                //                             [
                //                               Padding(
                //                                   padding: EdgeInsets.only(
                //                                       right: 5),
                //                                   child: Container(
                //                                       constraints: BoxConstraints(
                //                                         maxWidth: 300.0,
                //                                       ),
                //                                       child: Text(msg.textMessage,
                //                                         style: TextStyle(
                //                                             color: Colors.black,
                //                                             fontSize: 16.sp),))),
                //                               Padding(
                //                                 padding: EdgeInsets.only(
                //                                     top: 12.0),
                //                                 child: SizedBox(
                //                                   width: size.width * 0.19,
                //                                   child: Row(
                //                                     mainAxisSize: MainAxisSize
                //                                         .min,
                //                                     children:
                //                                     [
                //                                       Text("12:00 am",
                //                                         style: TextStyle(
                //                                             color: AppColors
                //                                                 .timeStampColor,
                //                                             fontSize: 11.sp),),
                //                                       SizedBox(
                //                                         width: 3.0,
                //                                       ),
                //                                       Icon(Icons.done_all,
                //                                         color: AppColors
                //                                             .tickColorInDarkMode,
                //                                         size: 13.0,),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //
                //                   ],
                //                 );
                //               }
                //               else if(msg.messageType == MessageType.image)
                //               {
                //                 return Column(
                //                   children: [
                //                     SizedBox(
                //                       height: size.height * 0.04,
                //                     ),
                //                     Container(
                //                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                //                       decoration: BoxDecoration(
                //                         color: AppColors.chatTimeLabelColor,
                //                         borderRadius: BorderRadius.circular(6.0),
                //                       ),
                //                       child: Text("25 January 2023", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),),
                //                     ),
                //                     SwipeTo(
                //                       onRightSwipe:(value){
                //                         chatController.setReply(true);
                //                         Future.delayed(const Duration(milliseconds: 200), () => FocusScope.of(context).requestFocus(focusNode));
                //                       },
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: Padding(
                //                           padding: EdgeInsets.only(right: 10.0),
                //                           child: Container(
                //                             decoration: BoxDecoration(
                //                               borderRadius: BorderRadius.circular(10.0),
                //                               border: Border.all(color: AppColors.orangeColor, width: 5.0),
                //                             ),
                //                             child: Image.file(
                //                               File(msg.imageMessage),
                //                               fit: BoxFit.cover,
                //                               width: msg.width,
                //                               height: msg.height,
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 );
                //               }
                //               else if(msg.messageType == MessageType.video)
                //               {
                //                 final controller = VideoPlayerController.file(File(msg.videoMessage))..initialize();
                //                 return Column(
                //                   children: [
                //                     SizedBox(
                //                       height: size.height * 0.04,
                //                     ),
                //                     Container(
                //                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                //                       decoration: BoxDecoration(
                //                         color: AppColors.chatTimeLabelColor,
                //                         borderRadius: BorderRadius.circular(6.0),
                //                       ),
                //                       child: Text("25 January 2023", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),),
                //                     ),
                //                     SwipeTo(
                //                       onRightSwipe:(value){
                //                         chatController.setReply(true);
                //                         Future.delayed(const Duration(milliseconds: 200), () => FocusScope.of(context).requestFocus(focusNode));
                //                       },
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: Padding(
                //                           padding: EdgeInsets.only(right: 10.0, bottom: 10,),
                //                           child: Container(
                //                             width: 250,
                //                             height: 300,
                //                             decoration: BoxDecoration(
                //                               borderRadius: BorderRadius.circular(10.0),
                //                               border: Border.all(color: AppColors.orangeColor, width: 5.0),
                //                             ),
                //                             child: Stack(
                //                               alignment: Alignment.center,
                //                               children: [
                //                                 VideoPlayer(
                //                                   controller,
                //                                 ),
                //
                //                                 Positioned(
                //                                   child: Container(
                //                                     padding: EdgeInsets.all(15.0),
                //                                     decoration: BoxDecoration(
                //                                       shape: BoxShape.circle,
                //                                       color: Colors.black.withOpacity(0.2),
                //                                     ),
                //                                     child: IconButton(
                //                                       padding: EdgeInsets.all(0),
                //                                       icon: Icon(chatController.controller!.value.isCompleted ? Icons.play_arrow : chatController.controller!.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 50.0,), onPressed: (){
                //                                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoApp(path: msg.videoMessage,)));
                //                                     },),
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 );
                //               }
                //
                //
                //             }
                //             else
                //             {
                //               if(msg.messageType == MessageType.text)
                //               {
                //                 return Column(
                //                   children: [
                //                     SizedBox(
                //                       height: size.height * 0.04,
                //                     ),
                //                     Container(
                //                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                //                       decoration: BoxDecoration(
                //                         color: AppColors.chatTimeLabelColor,
                //                         borderRadius: BorderRadius.circular(6.0),
                //                       ),
                //                       child: Text("25 January 2023", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),),
                //                     ),
                //
                //                     Dismissible(
                //                       key: UniqueKey(),
                //                       confirmDismiss: (a)async{},
                //                       direction: DismissDirection.endToStart,
                //                       child: Padding(
                //                         padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                //                         child: msg.textMessage.length > 30 ?  Bubble(
                //                           style: styleSomebody,
                //                           child:  Column(
                //                             mainAxisSize: MainAxisSize.min,
                //                             children:
                //                             [
                //                               Padding(
                //                                   padding: EdgeInsets.only(right: 5),
                //                                   child: Container(
                //                                       constraints: BoxConstraints(
                //                                         maxWidth: 300.0,
                //                                       ),
                //                                       child: Text(msg.textMessage, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                //                               Align(
                //                                 alignment: Alignment.bottomRight,
                //                                 child: SizedBox(
                //                                   width: size.width * 0.19,
                //                                   child: Row(
                //                                     mainAxisSize: MainAxisSize.min,
                //                                     children:
                //                                     [
                //                                       Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                //                                       SizedBox(
                //                                         width: 3.0,
                //                                       ),
                //                                       Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ) : Bubble(
                //                           style: styleSomebody,
                //                           child:  Row(
                //                             mainAxisSize: MainAxisSize.min,
                //                             children:
                //                             [
                //                               Padding(
                //                                   padding: EdgeInsets.only(right: 5),
                //                                   child: Container(
                //                                       constraints: BoxConstraints(
                //                                         maxWidth: 300.0,
                //                                       ),
                //                                       child: Text(msg.textMessage, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                //                               Padding(
                //                                 padding: EdgeInsets.only(top:12.0),
                //                                 child: SizedBox(
                //                                   width: size.width * 0.19,
                //                                   child: Row(
                //                                     mainAxisSize: MainAxisSize.min,
                //                                     children:
                //                                     [
                //                                       Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                //                                       SizedBox(
                //                                         width: 3.0,
                //                                       ),
                //                                       Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 );
                //
                //               }
                //               else if(msg.messageType == MessageType.image)
                //               {
                //                 return Column(
                //                   children: [
                //                     SizedBox(
                //                       height: size.height * 0.04,
                //                     ),
                //                     Container(
                //                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                //                       decoration: BoxDecoration(
                //                         color: AppColors.chatTimeLabelColor,
                //                         borderRadius: BorderRadius.circular(6.0),
                //                       ),
                //                       child: Text("25 January 2023", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),),
                //                     ),
                //                     Align(
                //                       alignment: Alignment.topRight,
                //                       child: Padding(
                //                         padding: EdgeInsets.only(right: 10.0),
                //                         child: Container(
                //                           decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.circular(10.0),
                //                             border: Border.all(color: AppColors.textFieldColor, width: 5.0),
                //                           ),
                //                           child: Image.file(
                //                             File(msg.imageMessage),
                //                             fit: BoxFit.cover,
                //                             width: msg.width,
                //                             height: msg.height,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 );
                //               }
                //
                //             }
                //
                //             // return Column(
                //             //   children: [
                //             //     SizedBox(
                //             //       height: size.height * 0.04,
                //             //     ),
                //             //     Container(
                //             //       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                //             //       decoration: BoxDecoration(
                //             //         color: AppColors.chatTimeLabelColor,
                //             //         borderRadius: BorderRadius.circular(6.0),
                //             //       ),
                //             //       child: Text("25 January 2023", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),),
                //             //     ),
                //             //   ],
                //             // );
                //           }
                //           else
                //           {
                //             if(msg.userId == "1122")
                //             {
                //               if(msg.messageType == MessageType.text)
                //               {
                //                 return SwipeTo(
                //                   onRightSwipe:(value){
                //                     chatController.setReply(true);
                //                     Future.delayed(const Duration(milliseconds: 200), () => FocusScope.of(context).requestFocus(focusNode));
                //                   },
                //                   child: Padding(
                //                     padding: EdgeInsets.symmetric(
                //                         vertical: size.height * 0.002),
                //                     child: msg.textMessage.length > 30 ? Bubble(
                //                       style: styleMe,
                //                       child: Column(
                //                         mainAxisSize: MainAxisSize.min,
                //                         children:
                //                         [
                //                           Padding(
                //                               padding: EdgeInsets.only(
                //                                   right: 5),
                //                               child: Container(
                //                                   constraints: BoxConstraints(
                //                                     maxWidth: 300.0,
                //                                   ),
                //                                   child: Text(msg.textMessage,
                //                                     style: TextStyle(
                //                                         color: Colors.black,
                //                                         fontSize: 16.sp),))),
                //                           Align(
                //                             alignment: Alignment.topRight,
                //                             child: SizedBox(
                //                               width: size.width * 0.19,
                //                               child: Row(
                //                                 mainAxisSize: MainAxisSize
                //                                     .min,
                //                                 children:
                //                                 [
                //                                   Text("12:00 am",
                //                                     style: TextStyle(
                //                                         color: AppColors
                //                                             .timeStampColor,
                //                                         fontSize: 11.sp),),
                //                                   SizedBox(
                //                                     width: 3.0,
                //                                   ),
                //                                   Icon(Icons.done_all,
                //                                     color: AppColors
                //                                         .tickColorInDarkMode,
                //                                     size: 13.0,),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ) : Bubble(
                //                       style: styleMe,
                //                       child: Row(
                //                         mainAxisSize: MainAxisSize.min,
                //                         children:
                //                         [
                //                           Padding(
                //                               padding: EdgeInsets.only(
                //                                   right: 5),
                //                               child: Container(
                //                                   constraints: BoxConstraints(
                //                                     maxWidth: 300.0,
                //                                   ),
                //                                   child: Text(msg.textMessage,
                //                                     style: TextStyle(
                //                                         color: Colors.black,
                //                                         fontSize: 16.sp),))),
                //                           Padding(
                //                             padding: EdgeInsets.only(
                //                                 top: 12.0),
                //                             child: SizedBox(
                //                               width: size.width * 0.19,
                //                               child: Row(
                //                                 mainAxisSize: MainAxisSize
                //                                     .min,
                //                                 children:
                //                                 [
                //                                   Text("12:00 am",
                //                                     style: TextStyle(
                //                                         color: AppColors
                //                                             .timeStampColor,
                //                                         fontSize: 11.sp),),
                //                                   SizedBox(
                //                                     width: 3.0,
                //                                   ),
                //                                   Icon(Icons.done_all,
                //                                     color: AppColors
                //                                         .tickColorInDarkMode,
                //                                     size: 13.0,),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               }
                //               else if(msg.messageType == MessageType.image)
                //               {
                //                 return SwipeTo(
                //                   onRightSwipe:(value){
                //                     chatController.setReply(true);
                //                     Future.delayed(const Duration(milliseconds: 200), () => FocusScope.of(context).requestFocus(focusNode));
                //                   },
                //                   child: Align(
                //                     alignment: Alignment.topRight,
                //                     child: Padding(
                //                       padding: EdgeInsets.only(right: 10.0),
                //                       child: Container(
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(10.0),
                //                           border: Border.all(color: AppColors.orangeColor, width: 5.0),
                //                         ),
                //                         child: Image.file(
                //                           File(msg.imageMessage),
                //                           fit: BoxFit.cover,
                //                           width: 250,
                //                           height: 300,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               }
                //               else if(msg.messageType == MessageType.video)
                //               {
                //                 final controller = VideoPlayerController.file(File(msg.videoMessage))..initialize();
                //                 return SwipeTo(
                //                   onRightSwipe:(value){
                //                     chatController.setReply(true);
                //                     Future.delayed(const Duration(milliseconds: 200), () => FocusScope.of(context).requestFocus(focusNode));
                //                   },
                //                   child: Align(
                //                     alignment: Alignment.topRight,
                //                     child: Padding(
                //                       padding: EdgeInsets.only(right: 10.0, bottom: 10),
                //                       child: Container(
                //                         width: 250,
                //                         height: 300,
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(10.0),
                //                           border: Border.all(color: AppColors.orangeColor, width: 5.0),
                //                         ),
                //                         child: Stack(
                //                           alignment: Alignment.center,
                //                           children: [
                //                             VideoPlayer(
                //                               controller,
                //                             ),
                //
                //                             Positioned(
                //                               child: Container(
                //                                 padding: EdgeInsets.all(15.0),
                //                                 decoration: BoxDecoration(
                //                                   shape: BoxShape.circle,
                //                                   color: Colors.black.withOpacity(0.2),
                //                                 ),
                //                                 child: IconButton(
                //                                   padding: EdgeInsets.all(0),
                //                                   icon: Icon(chatController.controller!.value.isCompleted ? Icons.play_arrow : chatController.controller!.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 50.0,), onPressed: (){
                //                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoApp(path: msg.videoMessage,)));
                //                                 },),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               }
                //
                //               // if(index == 0) {
                //               //   return Dismissible(
                //               //     key: UniqueKey(),
                //               //     confirmDismiss: (a) async {
                //               //       // WidgetsBinding.instance
                //               //       //     .addPostFrameCallback((timeStamp) {
                //               //       //   chatController.setReply(true);
                //               //       // });
                //               //
                //               //       FocusScope.of(context).requestFocus(
                //               //           focusNode);
                //               //     },
                //               //     direction: DismissDirection.startToEnd,
                //               //     child: Padding(
                //               //       padding: EdgeInsets.symmetric(
                //               //           vertical: size.height * 0.002),
                //               //       child: msg.message.length > 30 ? Bubble(
                //               //         style: styleMe,
                //               //         child: Column(
                //               //           mainAxisSize: MainAxisSize.min,
                //               //           children:
                //               //           [
                //               //             Padding(
                //               //                 padding: EdgeInsets.only(
                //               //                     right: 5),
                //               //                 child: Container(
                //               //                     constraints: BoxConstraints(
                //               //                       maxWidth: 300.0,
                //               //                     ),
                //               //                     child: Text(msg.message,
                //               //                       style: TextStyle(
                //               //                           color: Colors.black,
                //               //                           fontSize: 16.sp),))),
                //               //             Align(
                //               //               alignment: Alignment.topRight,
                //               //               child: SizedBox(
                //               //                 width: size.width * 0.19,
                //               //                 child: Row(
                //               //                   mainAxisSize: MainAxisSize
                //               //                       .min,
                //               //                   children:
                //               //                   [
                //               //                     Text("12:00 am",
                //               //                       style: TextStyle(
                //               //                           color: AppColors
                //               //                               .timeStampColor,
                //               //                           fontSize: 11.sp),),
                //               //                     SizedBox(
                //               //                       width: 3.0,
                //               //                     ),
                //               //                     Icon(Icons.done_all,
                //               //                       color: AppColors
                //               //                           .tickColorInDarkMode,
                //               //                       size: 13.0,),
                //               //                   ],
                //               //                 ),
                //               //               ),
                //               //             ),
                //               //           ],
                //               //         ),
                //               //       ) : Bubble(
                //               //         style: styleMe,
                //               //         child: Row(
                //               //           mainAxisSize: MainAxisSize.min,
                //               //           children:
                //               //           [
                //               //             Padding(
                //               //                 padding: EdgeInsets.only(
                //               //                     right: 5),
                //               //                 child: Container(
                //               //                     constraints: BoxConstraints(
                //               //                       maxWidth: 300.0,
                //               //                     ),
                //               //                     child: Text(msg.message,
                //               //                       style: TextStyle(
                //               //                           color: Colors.black,
                //               //                           fontSize: 16.sp),))),
                //               //             Padding(
                //               //               padding: EdgeInsets.only(
                //               //                   top: 12.0),
                //               //               child: SizedBox(
                //               //                 width: size.width * 0.19,
                //               //                 child: Row(
                //               //                   mainAxisSize: MainAxisSize
                //               //                       .min,
                //               //                   children:
                //               //                   [
                //               //                     Text("12:00 am",
                //               //                       style: TextStyle(
                //               //                           color: AppColors
                //               //                               .timeStampColor,
                //               //                           fontSize: 11.sp),),
                //               //                     SizedBox(
                //               //                       width: 3.0,
                //               //                     ),
                //               //                     Icon(Icons.done_all,
                //               //                       color: AppColors
                //               //                           .tickColorInDarkMode,
                //               //                       size: 13.0,),
                //               //                   ],
                //               //                 ),
                //               //               ),
                //               //             ),
                //               //           ],
                //               //         ),
                //               //       ),
                //               //     ),
                //               //   );
                //               // }
                //               // else
                //               //   {
                //               //     if(messages[index-1].userId == user2)
                //               //       {
                //               //         return Dismissible(
                //               //           key: UniqueKey(),
                //               //           confirmDismiss: (a) async {
                //               //             WidgetsBinding.instance
                //               //                 .addPostFrameCallback((timeStamp) {
                //               //               chatController.setReply(true);
                //               //             });
                //               //
                //               //             FocusScope.of(context).requestFocus(
                //               //                 focusNode);
                //               //           },
                //               //           direction: DismissDirection.startToEnd,
                //               //           child: Padding(
                //               //             padding: EdgeInsets.symmetric(
                //               //                 vertical: size.height * 0.002),
                //               //             child: msg.message.length > 30 ? Bubble(
                //               //               style: styleMeContinue,
                //               //               child: Column(
                //               //                 mainAxisSize: MainAxisSize.min,
                //               //                 children:
                //               //                 [
                //               //                   Padding(
                //               //                       padding: EdgeInsets.only(
                //               //                           right: 5),
                //               //                       child: Container(
                //               //                           constraints: BoxConstraints(
                //               //                             maxWidth: 300.0,
                //               //                           ),
                //               //                           child: Text(msg.message,
                //               //                             style: TextStyle(
                //               //                                 color: Colors.black,
                //               //                                 fontSize: 16.sp),))),
                //               //                   Align(
                //               //                     alignment: Alignment.topRight,
                //               //                     child: SizedBox(
                //               //                       width: size.width * 0.19,
                //               //                       child: Row(
                //               //                         mainAxisSize: MainAxisSize
                //               //                             .min,
                //               //                         children:
                //               //                         [
                //               //                           Text("12:00 am",
                //               //                             style: TextStyle(
                //               //                                 color: AppColors
                //               //                                     .timeStampColor,
                //               //                                 fontSize: 11.sp),),
                //               //                           SizedBox(
                //               //                             width: 3.0,
                //               //                           ),
                //               //                           Icon(Icons.done_all,
                //               //                             color: AppColors
                //               //                                 .tickColorInDarkMode,
                //               //                             size: 13.0,),
                //               //                         ],
                //               //                       ),
                //               //                     ),
                //               //                   ),
                //               //                 ],
                //               //               ),
                //               //             ) : Bubble(
                //               //               style: styleMeContinue,
                //               //               child: Row(
                //               //                 mainAxisSize: MainAxisSize.min,
                //               //                 children:
                //               //                 [
                //               //                   Padding(
                //               //                       padding: EdgeInsets.only(
                //               //                           right: 5),
                //               //                       child: Container(
                //               //                           constraints: BoxConstraints(
                //               //                             maxWidth: 300.0,
                //               //                           ),
                //               //                           child: Text(msg.message,
                //               //                             style: TextStyle(
                //               //                                 color: Colors.black,
                //               //                                 fontSize: 16.sp),))),
                //               //                   Padding(
                //               //                     padding: EdgeInsets.only(
                //               //                         top: 12.0),
                //               //                     child: SizedBox(
                //               //                       width: size.width * 0.19,
                //               //                       child: Row(
                //               //                         mainAxisSize: MainAxisSize
                //               //                             .min,
                //               //                         children:
                //               //                         [
                //               //                           Text("12:00 am",
                //               //                             style: TextStyle(
                //               //                                 color: AppColors
                //               //                                     .timeStampColor,
                //               //                                 fontSize: 11.sp),),
                //               //                           SizedBox(
                //               //                             width: 3.0,
                //               //                           ),
                //               //                           Icon(Icons.done_all,
                //               //                             color: AppColors
                //               //                                 .tickColorInDarkMode,
                //               //                             size: 13.0,),
                //               //                         ],
                //               //                       ),
                //               //                     ),
                //               //                   ),
                //               //                 ],
                //               //               ),
                //               //             ),
                //               //           ),
                //               //         );
                //               //       }
                //               //   }
                //             }
                //             else
                //             {
                //               if(msg.messageType == MessageType.text)
                //               {
                //                 return Dismissible(
                //                   key: UniqueKey(),
                //                   confirmDismiss: (a)async{},
                //                   direction: DismissDirection.endToStart,
                //                   child: Padding(
                //                     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                //                     child: msg.textMessage.length > 30 ?  Bubble(
                //                       style: styleSomebody,
                //                       child:  Column(
                //                         mainAxisSize: MainAxisSize.min,
                //                         children:
                //                         [
                //                           Padding(
                //                               padding: EdgeInsets.only(right: 5),
                //                               child: Container(
                //                                   constraints: BoxConstraints(
                //                                     maxWidth: 300.0,
                //                                   ),
                //                                   child: Text(msg.textMessage, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                //                           Align(
                //                             alignment: Alignment.bottomRight,
                //                             child: SizedBox(
                //                               width: size.width * 0.19,
                //                               child: Row(
                //                                 mainAxisSize: MainAxisSize.min,
                //                                 children:
                //                                 [
                //                                   Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                //                                   SizedBox(
                //                                     width: 3.0,
                //                                   ),
                //                                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ) : Bubble(
                //                       style: styleSomebody,
                //                       child:  Row(
                //                         mainAxisSize: MainAxisSize.min,
                //                         children:
                //                         [
                //                           Padding(
                //                               padding: EdgeInsets.only(right: 5),
                //                               child: Container(
                //                                   constraints: BoxConstraints(
                //                                     maxWidth: 300.0,
                //                                   ),
                //                                   child: Text(msg.textMessage, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                //                           Padding(
                //                             padding: EdgeInsets.only(top:12.0),
                //                             child: SizedBox(
                //                               width: size.width * 0.19,
                //                               child: Row(
                //                                 mainAxisSize: MainAxisSize.min,
                //                                 children:
                //                                 [
                //                                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                //                                   SizedBox(
                //                                     width: 3.0,
                //                                   ),
                //                                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               }
                //               else if(msg.messageType == MessageType.image)
                //               {
                //                 print("${msg.imageMessage} ********************");
                //                 return Align(
                //                   alignment: Alignment.topLeft,
                //                   child: Padding(
                //                     padding: EdgeInsets.only(right: 10.0),
                //                     child: Container(
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10.0),
                //                         border: Border.all(color: AppColors.textFieldColor, width: 5.0),
                //                       ),
                //                       child: Image.file(
                //                         File(msg.imageMessage),
                //                         fit: BoxFit.cover,
                //                         width: msg.width,
                //                         height: msg.height,
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               }
                //
                //             }
                //           }
                //
                //
                //
                //           // return Align(
                //           //   alignment: msg.userId == "1122" ? Alignment.topRight : Alignment.topLeft,
                //           //     child: Text(msg.message, style: TextStyle(color: Colors.black),));
                //         },
                //       );
                //     },
                //   ),
                // ),

                Offstage(
                  offstage: !emojiShowing,
                  child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        textEditingController: messageController,
                        onBackspacePressed: _onBackspacePressed,
                        config: Config(
                          columns: 7,
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 32 *
                              (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                                  ? 1.30
                                  : 1.0),
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          gridPadding: EdgeInsets.zero,
                          initCategory: Category.RECENT,
                          bgColor: const Color(0xFFF2F2F2),
                          indicatorColor: Colors.blue,
                          iconColor: Colors.grey,
                          iconColorSelected: Colors.blue,
                          backspaceColor: Colors.blue,
                          skinToneDialogBgColor: Colors.white,
                          skinToneIndicatorColor: Colors.grey,
                          enableSkinTones: true,
                          recentTabBehavior: RecentTabBehavior.RECENT,
                          recentsLimit: 28,
                          replaceEmojiOnLimitExceed: false,
                          noRecents: const Text(
                            'No Recents',
                            style: TextStyle(fontSize: 20, color: Colors.black26),
                            textAlign: TextAlign.center,
                          ),
                          loadingIndicator: const SizedBox.shrink(),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL,
                          checkPlatformCompatibility: true,
                        ),
                      )),
                ),
              ],
            ),
            Positioned(
                bottom: size.height * 0.1,
                right: 10,
                child: callingController.dropVideoScreen.value ? FloatingActionButton(
                  onPressed: (){}, child: SvgPicture.asset(AppIcons.callScreenIncomingCallIcon),) : Container()),
          ],
        ),
      ),
    );
  }
}
