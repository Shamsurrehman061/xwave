import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../OnGoingVideoCall/on_going_video_call.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ScrollController controller = ScrollController();
  ThemeManager themeManager = ThemeManager();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,


      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return[
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: Colors.white,),
              ),

            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        CircleAvatar(
                          radius: 41.0,
                          backgroundImage: AssetImage(AppImages.pic3),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text("Alex Linderson", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                        Text("@jhonabraham", style: TextStyle(color: Color(0xffCECECE), fontWeight: FontWeight.w300, fontSize: 12.sp),),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.01),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.orangeColor,
                              ),
                              child: SvgPicture.asset(AppIcons.homeMessengerIcon, color: Colors.white, width: 40, fit: BoxFit.scaleDown,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: false,)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(size.width * 0.025),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.orangeColor,
                                ),
                                child: SvgPicture.asset(AppIcons.callScreenVideoCallIcon, color: Colors.white, width: 40, fit: BoxFit.scaleDown,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnGoingVideoCallScreen(isVideoOn: true,)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(size.width * 0.01),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.orangeColor,
                                ),
                                child: SvgPicture.asset(AppIcons.userProfileScreenCallIcon, color: Colors.white, width: 40, fit: BoxFit.scaleDown,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.045),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.orangeColor,
                              ),
                              child: SvgPicture.asset(AppIcons.userProfileScreenMoreIcon, color: Colors.white, width: 40, fit: BoxFit.scaleDown,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
              color: themeManager.darkTheme ? AppColors.darkModeBlackColor : Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 35,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColors.containerBar,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),


                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      controller: controller,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Display Name", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 13.sp,),),
                            Text("Alex Linderson", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),

                            SizedBox(
                              height: size.height * 0.03,
                            ),

                            Text("Email Address", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 13.sp,),),
                            Text("jhonabraham20@gmail.com", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),

                            SizedBox(
                              height: size.height * 0.03,
                            ),

                            Text("Phone Number", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 13.sp,),),
                            Text("(320) 555-0104", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),

                            SizedBox(
                              height: size.height * 0.03,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                              [
                                Text("Media Shared", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontWeight: FontWeight.w300, fontSize: 14.sp),),
                                Text("View All", style: TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.w700, fontSize: 14.sp),),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),

                            Row(
                              children:
                              [
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        AppImages.nature,
                                        width: 60,
                                        height: 110,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  width: size.width * 0.005,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        AppImages.nature,
                                        width: 60,
                                        height: 110,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  width: size.width * 0.005,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(AppColors.mediaShadowColor, BlendMode.srcATop),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.center,
                                      children:
                                      [

                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(16.0),
                                            child: Container(
                                              width: double.infinity,
                                              child: Image.asset(
                                                AppImages.nature,
                                                width: 60,
                                                height: 110,
                                                fit: BoxFit.cover,
                                              ),
                                            )),


                                        Positioned(
                                            child: Text("255+", style: TextStyle(color: Colors.white, fontSize: 25.0),)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: size.height * 0.03,
                            ),

                            SizedBox(
                              height: size.height * 0.03,
                            ),

                            Text("Encryption", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),
                            Row(
                              children:
                              [
                                SizedBox(
                                    width: size.width * 0.7,
                                    child: Text("Messages and Calls are end-to-end encrypted", style: TextStyle(color:themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontWeight: FontWeight.w300, fontSize: 13.sp,),)),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                SvgPicture.asset(AppIcons.userProfileScreenEncryptedIcon),
                              ],
                            ),

                          ],
                        );
                      },
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
