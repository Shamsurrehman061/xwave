import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:x_wave/Utils/LocalDb/phone_contacts.dart';

import '../../Bloc/CreateChatBloc/create_chat_bloc.dart';
import '../../Bloc/CreateChatBloc/create_chat_events.dart';
import '../../Bloc/CreateChatBloc/create_chat_states.dart';
import '../../Models/PhoneNumberModelForHive/hive_phone_number_model.dart';
import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../Chat/chat.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({super.key});

  @override
  State<SelectContactScreen> createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  ScrollController controller = ScrollController();
  PhoneContacts phoneContacts = PhoneContacts();
  ThemeManager themeManager = ThemeManager();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.black,
              centerTitle: true,
              leading: Container(
                  padding: EdgeInsets.all(size.width * 0.035),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.searchBorderColor),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.homeSearchIcon,
                  )),
              title: Text(
                "Select Contact",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              ),
              actions: [
                Container(
                    padding: EdgeInsets.all(size.width * 0.035),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.searchBorderColor),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.contactScreenAddUserIcon,
                    )),
              ],
            ),
            SliverToBoxAdapter(
              child:  Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                  [
                    Container(
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeColor,
                      ),
                      child: SvgPicture.asset(AppIcons.contactScreenShareIcon),
                    ),
                    Container(
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeColor,
                      ),
                      child: SvgPicture.asset(AppIcons.contactScreenNewGroupIcon),
                    ),
                    Container(
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeColor,
                      ),
                      child: SvgPicture.asset(AppIcons.homeChannelIcon, color: Colors.white,),
                    ),
                    Container(
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeColor,
                      ),
                      child: SvgPicture.asset(AppIcons.contactScreenBroadcastIcon),
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
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0)),
              color: themeManager.darkTheme
                  ? AppColors.darkModeBlackColor
                  : Colors.white,
            ),
            child: Column(
              children: [
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
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "My Contact",
                        style: TextStyle(
                            color: themeManager.darkTheme
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "A",
                        style: TextStyle(
                            color: themeManager.darkTheme
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      )),
                ),
                // Expanded(
                //   child: StreamBuilder(
                //     stream: phoneContacts.box!.watch(),
                //     builder: (context, AsyncSnapshot<BoxEvent> snapshot){
                //       final contacts =
                //           Hive.box<PhoneNumberModelForHive>("PhoneContacts")
                //               .values
                //               .toList();
                //       return ListView.builder(
                //           itemCount: contacts.length,
                //           shrinkWrap: true,
                //           padding: EdgeInsets.zero,
                //           physics: BouncingScrollPhysics(),
                //           itemBuilder: (context, index) {
                //             return BlocListener<CreateChatBloc, CreateChatStates>(
                //               listener: (context, state){
                //                 if(state is CreateChatSuccessState)
                //                   {
                //                     BlocProvider.of<OneToOneChatBloc>(context).add(GetOneToOneChatList());
                //                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Chat(userId: state.createdChatData[0].users![0].id, userContact: state.createdChatData[0].users![0].contact,)));
                //                   }
                //               },
                //               child: Padding(
                //                 padding: EdgeInsets.symmetric(
                //                     horizontal: size.width * 0.06,
                //                     vertical: size.height * 0.01),
                //                 child: InkWell(
                //                   onTap: (){
                //                     BlocProvider.of<CreateChatBloc>(context).add(CreateChat(channel: contacts[index].userId));
                //                   },
                //                   child: Row(
                //                     children: [
                //                       contacts[index].avatar == ""
                //                           ? CircleAvatar(
                //                         radius: 28.0,
                //                         backgroundImage:
                //                         AssetImage(AppImages.pic2),
                //                       )
                //                           : CircleAvatar(
                //                         radius: 28.0,
                //                         backgroundImage:
                //                         NetworkImage(contacts[index].avatar),
                //                       ),
                //                       SizedBox(
                //                         width: size.width * 0.04,
                //                       ),
                //                       Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             contacts[index].contact,
                //                             style: TextStyle(
                //                               color: themeManager.darkTheme
                //                                   ? Colors.white
                //                                   : Colors.black,
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 18.sp,
                //                             ),
                //                           ),
                //                           Text(
                //                             "Never give up 👍",
                //                             style: TextStyle(
                //                               color: themeManager.darkTheme
                //                                   ? AppColors.darkModeLastMessageColor
                //                                   : AppColors.lastMessageColor,
                //                               fontWeight: FontWeight.w300,
                //                               fontSize: 12.sp,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           });
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
