import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_wave/Res/AppColors/app_colors.dart';

import '../../Bloc/ProfileInfoBloc/profile_info_bloc.dart';
import '../../Bloc/ProfileInfoBloc/profile_info_event.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/Initializer/initializer.dart';
import '../../Utils/NotificationServices/notification_services.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../CallScreen/call_screen.dart';
import '../ChatMainScreen/chat_main_screen.dart';
import '../GroupChatScreen/group_chat_screen.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices = NotificationServices();
  ThemeManager themeManager = ThemeManager();




  int selectedTab = 0;
  final list = [
    ChatMainScreen(),
    GroupChatScreen(),
    Center(
      child: Text("Channel", style: TextStyle(color: Colors.black),),
    ),
    CallScreen(),
  ];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Initializer().initialize(context);
    ProfileInfoBloc().add(GetProfileDats());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          setState(() {
            selectedTab = value;
          });
        },
        backgroundColor: themeManager.darkTheme ? AppColors.popUpMenuButton : Colors.white,
        currentIndex: selectedTab,
        useLegacyColorScheme: false,
        selectedItemColor: AppColors.orangeColor,
        unselectedItemColor: AppColors.greyColor,
        selectedLabelStyle: TextStyle(color: AppColors.orangeColor, fontSize: 12.sp, fontWeight: FontWeight.normal),
        unselectedLabelStyle: TextStyle(color: themeManager.darkTheme ? Colors.white : AppColors.greyColor,fontSize: 12.sp, fontWeight: FontWeight.normal),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items:
        [
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 5),
                  child: SvgPicture.asset(AppIcons.homeMessengerIcon, color: selectedTab == 0 ? AppColors.orangeColor: themeManager.darkTheme ? Colors.white : AppColors.greyColor,)),
              label: "Message",
              tooltip: "Message",
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 5),
                child: SvgPicture.asset(AppIcons.homeGroupIcon, color: selectedTab == 1 ? AppColors.orangeColor: themeManager.darkTheme ? Colors.white : AppColors.greyColor,)),
            label: "Group",
            tooltip: "Group",
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(bottom: 8, top: 10),
                child: SvgPicture.asset(AppIcons.homeChannelIcon, color: selectedTab == 2 ? AppColors.orangeColor: themeManager.darkTheme ? Colors.white : AppColors.greyColor,)),
            label: "Channel",
            tooltip: "Channel",
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(bottom: 8, top: 10),
                child: SvgPicture.asset(AppIcons.homeCallIcon, color: selectedTab == 3 ? AppColors.orangeColor: themeManager.darkTheme ? Colors.white : AppColors.greyColor,)),
            label: "Call",
            tooltip: "Call",
          ),
        ],
      ),
    );
  }
}
