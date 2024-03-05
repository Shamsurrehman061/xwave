import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_panel/controllers/slide_controller.dart';
import 'package:flutter_slidable_panel/widgets/slidable_panel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:status_view/status_view.dart';


import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';

import '../../Utils/ThemeManagement/theme_management.dart';
import '../Chat/chat.dart';
import '../ProfileScreen/profile_screen.dart';
import '../SearchScreen/search_screen.dart';


class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  ScrollController controller = ScrollController();
  ThemeManager themeManager = ThemeManager();


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


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: AppColors.orangeColor,
            borderRadius: BorderRadius.circular(13.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,4),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ]
        ),
        child: IconButton(
          onPressed: (){
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectContactScreen()));
          },
          icon: Icon(Icons.add, color: Colors.white,),
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
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.searchBorderColor),
                        color: Colors.transparent,
                      ),
                      child: SvgPicture.asset(AppIcons.homeSearchIcon, fit: BoxFit.scaleDown,)),
                ),
                clipBehavior: Clip.none,
                shadowColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("X WAVE", style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.05),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ProfileScreen()));
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
                padding: EdgeInsets.only(left: size.width * 0.050,),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                    [
                      Column(
                        children:
                        [
                          Stack(
                            children:
                            [
                              CircleAvatar(
                                radius: 28.0,
                                backgroundImage: AssetImage(AppImages.profilePic),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white
                                    ),
                                    child: Icon(Icons.add, color: Colors.black, size: 18,),
                                  )
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          Text("Me", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: Column(
                          children:
                          [
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
                            Text("Adil", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: Column(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Arina", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: Column(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic3),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Dean", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: Column(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Max", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: Column(
                          children:
                          [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: AssetImage(AppImages.pic2),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Wank", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
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
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
              color: themeManager.darkTheme ? AppColors.darkModeBlackColor : Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children:
                [
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






                  SizedBox(
                    height: size.height * 0.01,
                  ),






                ],
              ),
            ),
          ),
        ),
      ),


      // body: CustomScrollView(
      //   controller: controller,
      //   slivers: [
      //     SliverAppBar(
      //       pinned: false,
      //       floating: false,
      //       backgroundColor: Colors.black,
      //       leading: Container(
      //           padding: EdgeInsets.all(10.0),
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             border: Border.all(color: AppColors.searchBorderColor),
      //           ),
      //           child: SvgPicture.asset(AppIcons.homeSearchIcon,)),
      //       flexibleSpace: FlexibleSpaceBar(
      //         centerTitle: true,
      //         title: Text("X WAVE", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      //       ),
      //       actions: [
      //         Padding(
      //           padding: EdgeInsets.only(right: size.width * 0.04),
      //           child: InkWell(
      //             onTap: (){
      //               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ProfileScreen()));
      //             },
      //             child: CircleAvatar(
      //               backgroundImage: AssetImage(AppImages.profilePic),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: EdgeInsets.only(left: size.width * 0.050),
      //         child: SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             children:
      //             [
      //               Column(
      //                 children:
      //                 [
      //                   Stack(
      //                     children:
      //                     [
      //                       CircleAvatar(
      //                         radius: 30.0,
      //                         backgroundImage: AssetImage(AppImages.profilePic),
      //                       ),
      //                       Positioned(
      //                           bottom: 0,
      //                           right: 0,
      //                           child: Container(
      //                             decoration: BoxDecoration(
      //                                 shape: BoxShape.circle,
      //                                 color: Colors.white
      //                             ),
      //                             child: Icon(Icons.add, color: Colors.black, size: 18,),
      //                           )
      //                       ),
      //                     ],
      //                   ),
      //
      //                   SizedBox(
      //                     height: 15,
      //                   ),
      //                   Text("My Status", style: TextStyle(color: Colors.white, fontSize: 17,),),
      //                 ],
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(left: size.width * 0.055),
      //                 child: Column(
      //                   children:
      //                   [
      //                     CircleAvatar(
      //                       radius: 30.0,
      //                       backgroundImage: AssetImage(AppImages.pic1),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Text("Adil", style: TextStyle(color: Colors.white, fontSize: 17,),),
      //                   ],
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(left: size.width * 0.055),
      //                 child: Column(
      //                   children:
      //                   [
      //                     CircleAvatar(
      //                       radius: 30.0,
      //                       backgroundImage: AssetImage(AppImages.pic2),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Text("Arina", style: TextStyle(color: Colors.white, fontSize: 17,),),
      //                   ],
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(left: size.width * 0.055),
      //                 child: Column(
      //                   children:
      //                   [
      //                     CircleAvatar(
      //                       radius: 30.0,
      //                       backgroundImage: AssetImage(AppImages.pic3),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Text("Dean", style: TextStyle(color: Colors.white, fontSize: 17,),),
      //                   ],
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(left: size.width * 0.055),
      //                 child: Column(
      //                   children:
      //                   [
      //                     CircleAvatar(
      //                       radius: 30.0,
      //                       backgroundImage: AssetImage(AppImages.pic4),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Text("Max", style: TextStyle(color: Colors.white, fontSize: 17,),),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     SliverFillRemaining(
      //       child: Padding(
      //         padding: EdgeInsets.only(top: 50.0),
      //         child: Container(
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.only(topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      //             color: Colors.white,
      //           ),
      //           child: Column(
      //             children:
      //             [
      //               SizedBox(
      //                 height: size.height * 0.01,
      //               ),
      //
      //               Container(
      //                 width: 35,
      //                 height: 5,
      //                 decoration: BoxDecoration(
      //                   color: AppColors.containerBar,
      //                   borderRadius: BorderRadius.circular(30.0),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: size.height * 0.01,
      //               ),
      //
      //
      //
      //
      //               Expanded(
      //                 child: ListView.builder(
      //                     itemCount: 10,
      //                     shrinkWrap: true,
      //                     controller: controller,
      //                     itemBuilder: (context, index){
      //                       return Padding(
      //                         padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //                         child: Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children:
      //                           [
      //                             Row(
      //                               children:
      //                               [
      //                                 CircleAvatar(
      //                                   radius: 30.0,
      //                                   backgroundImage: AssetImage(AppImages.pic2),
      //                                 ),
      //                                 SizedBox(
      //                                   width: size.width * 0.04,
      //                                 ),
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children:
      //                                   [
      //                                     Text("Alex Linderson", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //                                     Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //
      //                             Row(
      //                               children:
      //                               [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.end,
      //                                   children:
      //                                   [
      //                                     Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //                                     Container(
      //                                       padding: EdgeInsets.all(size.width * 0.015),
      //                                       decoration: BoxDecoration(
      //                                         shape: BoxShape.circle,
      //                                         color: AppColors.orangeColor,
      //                                       ),
      //                                       child: Text("3", style: TextStyle(color: Colors.white),),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       );
      //                     }
      //                 ),
      //               ),
      //
      //
      //
      //               // ListView.builder(
      //               //     itemCount: 1,
      //               //     shrinkWrap: true,
      //               //     itemBuilder: (context, index){
      //               //       return Column(
      //               //         children: [
      //               //           Padding(
      //               //             padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //             child: Row(
      //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //               children:
      //               //               [
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     CircleAvatar(
      //               //                       radius: 30.0,
      //               //                       backgroundImage: AssetImage(AppImages.pic2),
      //               //                     ),
      //               //                     SizedBox(
      //               //                       width: size.width * 0.04,
      //               //                     ),
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.start,
      //               //                       children:
      //               //                       [
      //               //                         Text("Alex Linderson", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //                         Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.end,
      //               //                       children:
      //               //                       [
      //               //                         Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //                         Container(
      //               //                           padding: EdgeInsets.all(size.width * 0.015),
      //               //                           decoration: BoxDecoration(
      //               //                             shape: BoxShape.circle,
      //               //                             color: AppColors.orangeColor,
      //               //                           ),
      //               //                           child: Text("3", style: TextStyle(color: Colors.white),),
      //               //                         ),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //               ],
      //               //             ),
      //               //           ),
      //               //           Padding(
      //               //             padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //             child: Row(
      //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //               children:
      //               //               [
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     CircleAvatar(
      //               //                       radius: 30.0,
      //               //                       backgroundImage: AssetImage(AppImages.pic3),
      //               //                     ),
      //               //                     SizedBox(
      //               //                       width: size.width * 0.04,
      //               //                     ),
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.start,
      //               //                       children:
      //               //                       [
      //               //                         Text("Team Align", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //                         Text("Don’t miss to attend the meeting.", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.end,
      //               //                       children:
      //               //                       [
      //               //                         Text("yesterday", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //                         Container(
      //               //                           padding: EdgeInsets.all(size.width * 0.015),
      //               //                           decoration: BoxDecoration(
      //               //                             shape: BoxShape.circle,
      //               //                             color: AppColors.orangeColor,
      //               //                           ),
      //               //                           child: Text("4", style: TextStyle(color: Colors.white),),
      //               //                         ),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //               ],
      //               //             ),
      //               //           ),
      //               //
      //               //           Padding(
      //               //             padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //             child: Row(
      //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //               children:
      //               //               [
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     CircleAvatar(
      //               //                       radius: 30.0,
      //               //                       backgroundImage: AssetImage(AppImages.pic4),
      //               //                     ),
      //               //                     SizedBox(
      //               //                       width: size.width * 0.04,
      //               //                     ),
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.start,
      //               //                       children:
      //               //                       [
      //               //                         Text("John Ahraham", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //                         Text("Hey! Can you join the meeting?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.end,
      //               //                       children:
      //               //                       [
      //               //                         Text("a week ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //                         Container(
      //               //                           padding: EdgeInsets.all(size.width * 0.015),
      //               //                           decoration: BoxDecoration(
      //               //                             shape: BoxShape.circle,
      //               //                             color: AppColors.orangeColor,
      //               //                           ),
      //               //                           child: Text("6", style: TextStyle(color: Colors.white),),
      //               //                         ),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //               ],
      //               //             ),
      //               //           ),
      //               //           Padding(
      //               //             padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //             child: Row(
      //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //               children:
      //               //               [
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     CircleAvatar(
      //               //                       radius: 30.0,
      //               //                       backgroundImage: AssetImage(AppImages.pic2),
      //               //                     ),
      //               //                     SizedBox(
      //               //                       width: size.width * 0.04,
      //               //                     ),
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.start,
      //               //                       children:
      //               //                       [
      //               //                         Text("Alex Linderson", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //                         Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.end,
      //               //                       children:
      //               //                       [
      //               //                         Text("02 / 11 / 23", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //                         Container(
      //               //                           padding: EdgeInsets.all(size.width * 0.015),
      //               //                           decoration: BoxDecoration(
      //               //                             shape: BoxShape.circle,
      //               //                             color: AppColors.orangeColor,
      //               //                           ),
      //               //                           child: Text("10", style: TextStyle(color: Colors.white),),
      //               //                         ),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //               ],
      //               //             ),
      //               //           ),
      //               //           Padding(
      //               //             padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //             child: Row(
      //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //               children:
      //               //               [
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     CircleAvatar(
      //               //                       radius: 30.0,
      //               //                       backgroundImage: AssetImage(AppImages.pic1),
      //               //                     ),
      //               //                     SizedBox(
      //               //                       width: size.width * 0.04,
      //               //                     ),
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.start,
      //               //                       children:
      //               //                       [
      //               //                         Text("Sabila Sayma", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //                         Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.end,
      //               //                       children:
      //               //                       [
      //               //                         Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //                         Container(
      //               //                           padding: EdgeInsets.all(size.width * 0.015),
      //               //                           decoration: BoxDecoration(
      //               //                             shape: BoxShape.circle,
      //               //                             color: AppColors.orangeColor,
      //               //                           ),
      //               //                           child: Text("3", style: TextStyle(color: Colors.white),),
      //               //                         ),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //               ],
      //               //             ),
      //               //           ),
      //               //           Padding(
      //               //             padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //             child: Row(
      //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //               children:
      //               //               [
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     CircleAvatar(
      //               //                       radius: 30.0,
      //               //                       backgroundImage: AssetImage(AppImages.pic2),
      //               //                     ),
      //               //                     SizedBox(
      //               //                       width: size.width * 0.04,
      //               //                     ),
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.start,
      //               //                       children:
      //               //                       [
      //               //                         Text("John Borino", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //                         Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //
      //               //                 Row(
      //               //                   children:
      //               //                   [
      //               //                     Column(
      //               //                       crossAxisAlignment: CrossAxisAlignment.end,
      //               //                       children:
      //               //                       [
      //               //                         Text("2 days ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //                         Container(
      //               //                           padding: EdgeInsets.all(size.width * 0.015),
      //               //                           decoration: BoxDecoration(
      //               //                             shape: BoxShape.circle,
      //               //                             color: AppColors.orangeColor,
      //               //                           ),
      //               //                           child: Text("7", style: TextStyle(color: Colors.white),),
      //               //                         ),
      //               //                       ],
      //               //                     ),
      //               //                   ],
      //               //                 ),
      //               //               ],
      //               //             ),
      //               //           ),
      //               //           // Padding(
      //               //           //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //           //   child: Row(
      //               //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //           //     children:
      //               //           //     [
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           CircleAvatar(
      //               //           //             radius: 30.0,
      //               //           //             backgroundImage: AssetImage(AppImages.pic3),
      //               //           //           ),
      //               //           //           SizedBox(
      //               //           //             width: size.width * 0.04,
      //               //           //           ),
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.start,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("Angel Dayna", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //           //               Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.end,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //           //               Container(
      //               //           //                 padding: EdgeInsets.all(size.width * 0.015),
      //               //           //                 decoration: BoxDecoration(
      //               //           //                   shape: BoxShape.circle,
      //               //           //                   color: AppColors.orangeColor,
      //               //           //                 ),
      //               //           //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //               //           //               ),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //     ],
      //               //           //   ),
      //               //           // ),
      //               //           // Padding(
      //               //           //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //           //   child: Row(
      //               //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //           //     children:
      //               //           //     [
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           CircleAvatar(
      //               //           //             radius: 30.0,
      //               //           //             backgroundImage: AssetImage(AppImages.pic4),
      //               //           //           ),
      //               //           //           SizedBox(
      //               //           //             width: size.width * 0.04,
      //               //           //           ),
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.start,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("John Ahraham", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //           //               Text("Hey! Can you join the meeting?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.end,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //           //               Container(
      //               //           //                 padding: EdgeInsets.all(size.width * 0.015),
      //               //           //                 decoration: BoxDecoration(
      //               //           //                   shape: BoxShape.circle,
      //               //           //                   color: AppColors.orangeColor,
      //               //           //                 ),
      //               //           //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //               //           //               ),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //     ],
      //               //           //   ),
      //               //           // ),
      //               //           // Padding(
      //               //           //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //           //   child: Row(
      //               //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //           //     children:
      //               //           //     [
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           CircleAvatar(
      //               //           //             radius: 30.0,
      //               //           //             backgroundImage: AssetImage(AppImages.pic3),
      //               //           //           ),
      //               //           //           SizedBox(
      //               //           //             width: size.width * 0.04,
      //               //           //           ),
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.start,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("Team Align", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //           //               Text("Don’t miss to attend the meeting.", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.end,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //           //               Container(
      //               //           //                 padding: EdgeInsets.all(size.width * 0.015),
      //               //           //                 decoration: BoxDecoration(
      //               //           //                   shape: BoxShape.circle,
      //               //           //                   color: AppColors.orangeColor,
      //               //           //                 ),
      //               //           //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //               //           //               ),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //     ],
      //               //           //   ),
      //               //           // ),
      //               //           // Padding(
      //               //           //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //               //           //   child: Row(
      //               //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               //           //     children:
      //               //           //     [
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           CircleAvatar(
      //               //           //             radius: 30.0,
      //               //           //             backgroundImage: AssetImage(AppImages.pic4),
      //               //           //           ),
      //               //           //           SizedBox(
      //               //           //             width: size.width * 0.04,
      //               //           //           ),
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.start,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("John Ahraham", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //               //           //               Text("Hey! Can you join the meeting?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //
      //               //           //       Row(
      //               //           //         children:
      //               //           //         [
      //               //           //           Column(
      //               //           //             crossAxisAlignment: CrossAxisAlignment.end,
      //               //           //             children:
      //               //           //             [
      //               //           //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //               //           //               Container(
      //               //           //                 padding: EdgeInsets.all(size.width * 0.015),
      //               //           //                 decoration: BoxDecoration(
      //               //           //                   shape: BoxShape.circle,
      //               //           //                   color: AppColors.orangeColor,
      //               //           //                 ),
      //               //           //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //               //           //               ),
      //               //           //             ],
      //               //           //           ),
      //               //           //         ],
      //               //           //       ),
      //               //           //     ],
      //               //           //   ),
      //               //           // ),
      //               //           SizedBox(
      //               //             height: size.height * 0.02,
      //               //           ),
      //               //         ],
      //               //       );
      //               //     }
      //               // ),
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     // SliverList(
      //     //   delegate: SliverChildBuilderDelegate(
      //     //         childCount: 1,
      //     //         (context, index) {
      //     //           return Expanded(
      //     //             child: Container(
      //     //               width: double.infinity,
      //     //               decoration: BoxDecoration(
      //     //                 borderRadius: BorderRadius.only(topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      //     //                 color: Colors.white,
      //     //               ),
      //     //               child: Column(
      //     //                 children:
      //     //                 [
      //     //                   SizedBox(
      //     //                     height: size.height * 0.01,
      //     //                   ),
      //     //
      //     //                   Container(
      //     //                     width: 35,
      //     //                     height: 5,
      //     //                     decoration: BoxDecoration(
      //     //                       color: AppColors.containerBar,
      //     //                       borderRadius: BorderRadius.circular(30.0),
      //     //                     ),
      //     //                   ),
      //     //                   SizedBox(
      //     //                     height: size.height * 0.03,
      //     //                   ),
      //     //
      //     //
      //     //
      //     //
      //     //
      //     //                   ListView.builder(
      //     //                       itemCount: 1,
      //     //                       shrinkWrap: true,
      //     //                       itemBuilder: (context, index){
      //     //                         return Column(
      //     //                           children: [
      //     //                             Padding(
      //     //                               padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                               child: Row(
      //     //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                                 children:
      //     //                                 [
      //     //                                   Row(
      //     //                                     children:
      //     //                                     [
      //     //                                       CircleAvatar(
      //     //                                         radius: 30.0,
      //     //                                         backgroundImage: AssetImage(AppImages.pic2),
      //     //                                       ),
      //     //                                       SizedBox(
      //     //                                         width: size.width * 0.04,
      //     //                                       ),
      //     //                                       Column(
      //     //                                         crossAxisAlignment: CrossAxisAlignment.start,
      //     //                                         children:
      //     //                                         [
      //     //                                           Text("Alex Linderson", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                                           Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                                         ],
      //     //                                       ),
      //     //                                     ],
      //     //                                   ),
      //     //
      //     //                                   Row(
      //     //                                     children:
      //     //                                     [
      //     //                                       Column(
      //     //                                         crossAxisAlignment: CrossAxisAlignment.end,
      //     //                                         children:
      //     //                                         [
      //     //                                           Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                                           Container(
      //     //                                             padding: EdgeInsets.all(size.width * 0.015),
      //     //                                             decoration: BoxDecoration(
      //     //                                               shape: BoxShape.circle,
      //     //                                               color: AppColors.orangeColor,
      //     //                                             ),
      //     //                                             child: Text("3", style: TextStyle(color: Colors.white),),
      //     //                                           ),
      //     //                                         ],
      //     //                                       ),
      //     //                                     ],
      //     //                                   ),
      //     //                                 ],
      //     //                               ),
      //     //                             ),
      //     //                             Padding(
      //     //                               padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                               child: Row(
      //     //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                                 children:
      //     //                                 [
      //     //                                   Row(
      //     //                                     children:
      //     //                                     [
      //     //                                       CircleAvatar(
      //     //                                         radius: 30.0,
      //     //                                         backgroundImage: AssetImage(AppImages.pic3),
      //     //                                       ),
      //     //                                       SizedBox(
      //     //                                         width: size.width * 0.04,
      //     //                                       ),
      //     //                                       Column(
      //     //                                         crossAxisAlignment: CrossAxisAlignment.start,
      //     //                                         children:
      //     //                                         [
      //     //                                           Text("Team Align", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                                           Text("Don’t miss to attend the meeting.", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                                         ],
      //     //                                       ),
      //     //                                     ],
      //     //                                   ),
      //     //
      //     //                                   Row(
      //     //                                     children:
      //     //                                     [
      //     //                                       Column(
      //     //                                         crossAxisAlignment: CrossAxisAlignment.end,
      //     //                                         children:
      //     //                                         [
      //     //                                           Text("yesterday", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                                           Container(
      //     //                                             padding: EdgeInsets.all(size.width * 0.015),
      //     //                                             decoration: BoxDecoration(
      //     //                                               shape: BoxShape.circle,
      //     //                                               color: AppColors.orangeColor,
      //     //                                             ),
      //     //                                             child: Text("4", style: TextStyle(color: Colors.white),),
      //     //                                           ),
      //     //                                         ],
      //     //                                       ),
      //     //                                     ],
      //     //                                   ),
      //     //                                 ],
      //     //                               ),
      //     //                             ),
      //     //
      //     //                             Padding(
      //     //                               padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                               child: Row(
      //     //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                                 children:
      //     //                                 [
      //     //                                   Row(
      //     //                                     children:
      //     //                                     [
      //     //                                       CircleAvatar(
      //     //                                         radius: 30.0,
      //     //                                         backgroundImage: AssetImage(AppImages.pic4),
      //     //                                       ),
      //     //                                       SizedBox(
      //     //                                         width: size.width * 0.04,
      //     //                                       ),
      //     //                                       Column(
      //     //                                         crossAxisAlignment: CrossAxisAlignment.start,
      //     //                                         children:
      //     //                                         [
      //     //                                           Text("John Ahraham", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                                           Text("Hey! Can you join the meeting?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                                         ],
      //     //                                       ),
      //     //                                     ],
      //     //                                   ),
      //     //
      //     //                                   Row(
      //     //                                     children:
      //     //                                     [
      //     //                                       Column(
      //     //                                         crossAxisAlignment: CrossAxisAlignment.end,
      //     //                                         children:
      //     //                                         [
      //     //                                           Text("a week ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                                           Container(
      //     //                                             padding: EdgeInsets.all(size.width * 0.015),
      //     //                                             decoration: BoxDecoration(
      //     //                                               shape: BoxShape.circle,
      //     //                                               color: AppColors.orangeColor,
      //     //                                             ),
      //     //                                             child: Text("6", style: TextStyle(color: Colors.white),),
      //     //                                           ),
      //     //                                         ],
      //     //                                       ),
      //     //                                     ],
      //     //                                   ),
      //     //                                 ],
      //     //                               ),
      //     //                             ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic2),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("Alex Linderson", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("02 / 11 / 23", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("10", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic1),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("Sabila Sayma", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic2),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("John Borino", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("2 days ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("7", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic3),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("Angel Dayna", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("How are you today?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic4),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("John Ahraham", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("Hey! Can you join the meeting?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic3),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("Team Align", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("Don’t miss to attend the meeting.", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             // Padding(
      //     //                             //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
      //     //                             //   child: Row(
      //     //                             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //                             //     children:
      //     //                             //     [
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           CircleAvatar(
      //     //                             //             radius: 30.0,
      //     //                             //             backgroundImage: AssetImage(AppImages.pic4),
      //     //                             //           ),
      //     //                             //           SizedBox(
      //     //                             //             width: size.width * 0.04,
      //     //                             //           ),
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.start,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("John Ahraham", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),
      //     //                             //               Text("Hey! Can you join the meeting?", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 17,),),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //
      //     //                             //       Row(
      //     //                             //         children:
      //     //                             //         [
      //     //                             //           Column(
      //     //                             //             crossAxisAlignment: CrossAxisAlignment.end,
      //     //                             //             children:
      //     //                             //             [
      //     //                             //               Text("2 min ago", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.bold, fontSize: 17,),),
      //     //                             //               Container(
      //     //                             //                 padding: EdgeInsets.all(size.width * 0.015),
      //     //                             //                 decoration: BoxDecoration(
      //     //                             //                   shape: BoxShape.circle,
      //     //                             //                   color: AppColors.orangeColor,
      //     //                             //                 ),
      //     //                             //                 child: Text("3", style: TextStyle(color: Colors.white),),
      //     //                             //               ),
      //     //                             //             ],
      //     //                             //           ),
      //     //                             //         ],
      //     //                             //       ),
      //     //                             //     ],
      //     //                             //   ),
      //     //                             // ),
      //     //                             SizedBox(
      //     //                               height: size.height * 0.02,
      //     //                             ),
      //     //                           ],
      //     //                         );
      //     //                       }
      //     //                   ),
      //     //
      //     //
      //     //                 ],
      //     //               ),
      //     //             ),
      //     //           );
      //     //         },
      //     //
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }
}
