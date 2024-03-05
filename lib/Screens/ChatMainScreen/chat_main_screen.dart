import 'dart:async';
import 'dart:ffi';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:status_view/status_view.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:x_wave/Bloc/PhoneNumbersBloc/phone_number_event.dart';
import 'package:x_wave/Utils/LocalDb/user_local_date.dart';

import '../../Bloc/FcmTokenBloc/fcm_token_bloc.dart';
import '../../Bloc/FcmTokenBloc/fcm_token_events.dart';

import '../../Bloc/PhoneNumbersBloc/phone_numbers_bloc.dart';

import '../../Bloc/ProfileInfoBloc/profile_info_bloc.dart';
import '../../Bloc/ProfileInfoBloc/profile_info_event.dart';
import '../../Controllers/PhoneNumberController/phone_number_controller.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';

import '../../Utils/NotificationServices/notification_services.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../CallScreen2/call_screen_2.dart';
import '../Chat/chat.dart';
import '../ProfileScreen/profile_screen.dart';
import '../SearchScreen/search_screen.dart';
import '../SelectContactScreen/select_contact_screen.dart';


import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../Zego/zego.dart';


class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key});

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  ScrollController controller = ScrollController();
  ThemeManager themeManager = ThemeManager();
  UserData userData = UserData();
  final SlideController _slideController = SlideController(
    usePreActionController: false,
    usePostActionController: true,
  );
  final SlideController _slideController1 = SlideController(
    usePreActionController: false,
    usePostActionController: true,
  );
  final SlideController _slideController3 = SlideController(
    usePreActionController: false,
    usePostActionController: true,
  );
  final SlideController _slideController4 = SlideController(
    usePreActionController: false,
    usePostActionController: true,
  );

  var numberList = [];

  bool swipe1 = false;
  bool swipe2 = false;
  bool swipe3 = false;
  bool swipe4 = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              color: AppColors.orangeColor,
              borderRadius: BorderRadius.circular(13.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ]),
          child: IconButton(
            onPressed: ()async{
              // final token =await  NotificationServices().getFcmToken();
              // print("token **************** $token");
              // SaveFcmTokenBloc().add(SaveFcmToken(fcmToken: token));
              //FcmTokenBloc().add(GetFcmToken());

              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectContactScreen()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),

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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.searchBorderColor),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.homeSearchIcon,
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "X WAVE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.05),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppImages.profilePic),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.050,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 28.0,
                                  backgroundImage:
                                      AssetImage(AppImages.profilePic),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Me",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.025),
                          child: Column(
                            children: [
                              StatusView(
                                radius: 28.0,
                                spacing: 15,
                                strokeWidth: 2,
                                indexOfSeenStatus: 2,
                                numberOfStatus: 5,
                                padding: 4,
                                seenColor: Colors.white,
                                unSeenColor: AppColors.orangeColor,
                                centerImageUrl: 'https://picsum.photos/200/300',
                                // child: CircleAvatar(
                                //   radius: 30.0,
                                //   backgroundImage: AssetImage(AppImages.pic1),
                                // ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Adil",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.025),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic2),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Arina",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.025),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic3),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Dean",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.025),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic4),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Max",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.025),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.pic2),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Wank",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
                color: themeManager.darkTheme
                    ? AppColors.darkModeBlackColor
                    : Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
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
