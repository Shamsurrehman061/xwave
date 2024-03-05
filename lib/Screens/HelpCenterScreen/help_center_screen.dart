import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../HomeScreen/home_screen.dart';
import '../ProfileScreen/profile_screen.dart';



class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  ThemeManager themeManager = ThemeManager();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children:
          [
            SizedBox(
              height: size.height * 0.01,
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ProfileScreen()));
                  }, icon: Icon(Icons.arrow_back, color: AppColors.orangeColor,)),
                  Text("Help Center", style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
                ],
              ),
            ),



            SizedBox(
              height: size.height * 0.02,
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                  color:themeManager.darkTheme ? AppColors.darkModeBlackColor : Colors.white,
                ),
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
                      height: size.height * 0.06,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.dividerColor,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                      child: Row(
                        children:
                        [
                          Container(
                            padding: EdgeInsets.all(size.width * 0.04),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orangeColor,
                            ),
                            child: SvgPicture.asset(AppIcons.profileScreenHelpIcon, color: Colors.white,),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text("Help Center", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                      child: Row(
                        children:
                        [
                          Container(
                            padding: EdgeInsets.all(size.width * 0.04),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orangeColor,
                            ),
                            child: SvgPicture.asset(AppIcons.profileScreenLockIcon),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text("Terms & Conditions", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                      child: Row(
                        children:
                        [
                          Container(
                            padding: EdgeInsets.all(size.width * 0.04),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orangeColor,
                            ),
                            child: SvgPicture.asset(AppIcons.notificationIcon, color: Colors.white,),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text("Privacy Policy", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                      child: Row(
                        children:
                        [
                          Container(
                            padding: EdgeInsets.all(size.width * 0.04),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orangeColor,
                            ),
                            child: SvgPicture.asset(AppIcons.homeMessengerIcon, color: Colors.white,),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text("Contact Us", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp,),),
                        ],
                      ),
                    ),












                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
