import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../OnGoingVideoCall/on_going_video_call.dart';
import '../SearchScreen/search_screen.dart';



class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  ThemeManager themeManager = ThemeManager();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              sliver: SliverAppBar(
                pinned: false,
                floating: false,
                backgroundColor: Colors.black,
                leadingWidth: size.width * 0.2,
                leading: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.searchBorderColor),
                      ),
                      child: SvgPicture.asset(AppIcons.homeSearchIcon, fit: BoxFit.scaleDown,)),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Calls", style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.04),
                    child: Container(
                        padding: EdgeInsets.all(size.width * 0.035),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.searchBorderColor),
                        ),
                        child: SvgPicture.asset(AppIcons.callScreenAddCallIcon, width: 25, fit: BoxFit.scaleDown,)),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
              color: themeManager.darkTheme ? AppColors.darkModeBlackColor : Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children:
                [
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  Container(
                    width: 35,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.containerBar,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),



                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.035, bottom: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Row(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Container(
                                    width: size.width * 0.4,
                                    child: Text("Alex Linderson", overflow: TextOverflow.ellipsis, style: GoogleFonts.roboto(textStyle: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),))),
                                Row(
                                  children:
                                  [
                                    SvgPicture.asset(AppIcons.callScreenIncomingCallIcon),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text("Today, 09:30 AM", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children:
                          [
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: false,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenAudioCallIcon)),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.035, bottom: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Row(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Container(
                                    width: size.width * 0.4,
                                    child: Text("Alex Linderson", overflow: TextOverflow.ellipsis, style: GoogleFonts.roboto(textStyle: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),))),
                                Row(
                                  children:
                                  [
                                    SvgPicture.asset(AppIcons.callScreenIncomingCallIcon),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text("Today, 09:30 AM", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children:
                          [
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: false,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenAudioCallIcon)),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.035, bottom: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Row(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Container(
                                    width: size.width * 0.4,
                                    child: Text("Alex Linderson", overflow: TextOverflow.ellipsis, style: GoogleFonts.roboto(textStyle: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),))),
                                Row(
                                  children:
                                  [
                                    SvgPicture.asset(AppIcons.callScreenIncomingCallIcon),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text("Today, 09:30 AM", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children:
                          [
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: false,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenAudioCallIcon)),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.035, bottom: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Row(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Container(
                                    width: size.width * 0.4,
                                    child: Text("Alex Linderson", overflow: TextOverflow.ellipsis, style: GoogleFonts.roboto(textStyle: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),))),
                                Row(
                                  children:
                                  [
                                    SvgPicture.asset(AppIcons.callScreenIncomingCallIcon),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text("Today, 09:30 AM", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children:
                          [
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: false,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenAudioCallIcon)),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.035, bottom: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Row(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Container(
                                    width: size.width * 0.4,
                                    child: Text("Alex Linderson", overflow: TextOverflow.ellipsis, style: GoogleFonts.roboto(textStyle: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),))),
                                Row(
                                  children:
                                  [
                                    SvgPicture.asset(AppIcons.callScreenIncomingCallIcon),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text("Today, 09:30 AM", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children:
                          [
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: false,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenAudioCallIcon)),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                                },
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon)),
                          ],
                        ),
                      ],
                    ),
                  ),





                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
