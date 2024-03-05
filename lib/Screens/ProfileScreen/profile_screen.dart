import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hive/hive.dart';
import 'package:x_wave/Utils/LocalDb/login_session.dart';

import '../../Models/UserProfileData/user_profile_data.dart';
import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/LocalDb/user_profile_data.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../HelpCenterScreen/help_center_screen.dart';
import '../HomeScreen/home_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController controller = ScrollController();
  ThemeManager themeManager = ThemeManager();
  LoginSession loginSession = LoginSession();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const HomeScreen()));
                  }, icon: Icon(Icons.arrow_back, color: AppColors.orangeColor,)),
                  Text("Settings", style: TextStyle(color: Colors.white, fontSize: 18.sp),),
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
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
                  color: themeManager.darkTheme ? AppColors.darkModeBlackColor : Colors.white,
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
                      height: size.height * 0.02,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                      child: StreamBuilder(
                        stream: UserProfileData().box!.watch(),
                        builder: (BuildContext context, AsyncSnapshot<BoxEvent> snapshot){
                          var userData = Hive.box<UserProfileDataHive>("UserProfileData").values.toList();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                            [
                              Row(
                                children:
                                [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(userData[0].avatar),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:
                                    [
                                      Text(userData[0].username, style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w700, fontSize: 20.sp,),),
                                      Text("Never give up 👍", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                ],
                              ),

                              SvgPicture.asset(AppIcons.profileScreenQrCode),
                            ],
                          );
                        },),
                    ),

                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.dividerColor,
                    ),
                    SizedBox(
                      height: size.height * 0.015,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("Account", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                              Text("Privacy, Security, Change number", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        [
                          Row(
                            children:
                            [
                              Container(
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.orangeColor,
                                ),
                                child: SvgPicture.asset(themeManager.darkTheme ? AppIcons.lightIcon : AppIcons.darkIcon),
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  Text("Theme", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                                  Text(themeManager.darkTheme ? "Light" : "Dark", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp,),),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children:
                            [
                              FlutterSwitch(
                                height: 32,
                                width: 55,
                                value: themeManager.darkTheme,
                                borderRadius: 30.0,
                                activeToggleColor: Colors.black,
                                inactiveToggleColor: Colors.white,
                                toggleSize: 28,
                                padding: 2,
                                activeColor: AppColors.trackerColor,
                                inactiveColor: AppColors.trackerColor,
                                activeIcon: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: SvgPicture.asset(AppIcons.darkIcon, color: Colors.white, fit: BoxFit.cover, height: 50,)),
                                inactiveIcon: SvgPicture.asset(AppIcons.lightIcon, color: AppColors.orangeColor, fit: BoxFit.cover, height: 90,),
                                onToggle: (val){
                                  themeManager.switchTheme();
                                  setState((){
                                  });
                                },
                              ),
                            ],
                          ),

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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("Chat", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                              Text("Chat History,theme,wallpapers", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp,),),
                            ],
                          ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("Notifications", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                              Text("Message, group and others", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpCenterScreen()));
                      },
                      child: Padding(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Text("Help", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                                Text("Help center,contact us,privacy policy", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp,),),
                              ],
                            ),
                          ],
                        ),
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
                            child: SvgPicture.asset(AppIcons.profileScreenDataIcon, color: Colors.white,),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("Storage and data", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                              Text("Network usage, storage usage", style: TextStyle(color: themeManager.darkTheme ? AppColors.darkModeLastMessageColor : AppColors.lastMessageColor, fontSize: 12.sp,),),
                            ],
                          ),
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
                            child: SvgPicture.asset(AppIcons.profileScreenUsersIcon, color: Colors.white,),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text("Invite a friend", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        loginSession.saveLoginSession(false);
                      },
                      child: Padding(
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
                              child: SvgPicture.asset(AppIcons.profileScreenUsersIcon, color: Colors.white,),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Text("Logout", style: TextStyle(color: themeManager.darkTheme ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp,),),
                          ],
                        ),
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
