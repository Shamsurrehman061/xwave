import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/ThemeManagement/theme_management.dart';


class BlockUserList extends StatefulWidget {
  const BlockUserList({super.key});

  @override
  State<BlockUserList> createState() => _BlockUserListState();
}

class _BlockUserListState extends State<BlockUserList> {
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
                leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.searchBorderColor),
                    ),
                    child: SvgPicture.asset(AppIcons.homeSearchIcon, fit: BoxFit.scaleDown,)),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Blocked Contacts", style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.05),
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.searchBorderColor),
                        ),
                        child: SvgPicture.asset(AppIcons.blockScreenAddUserIcon, fit: BoxFit.scaleDown,)),
                  ),
                ],
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
              color:themeManager.darkTheme ? Colors.white : AppColors.darkModeBlackColor,
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
                    height: size.height * 0.01,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.01),
                    child: Row(
                      children:
                      [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(AppImages.pic3),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("Katrina Kaif", style: TextStyle(color:themeManager.darkTheme ? Colors.black : Colors.white, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                            Text("Life is beautiful 👌", style: TextStyle(color:themeManager.darkTheme ?  AppColors.lastMessageColor : AppColors.darkModeLastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
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
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(AppImages.pic4),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("Ranveer Singh", style: TextStyle(color:themeManager.darkTheme ? Colors.black : Colors.white, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                            Text("Be your own hero 💪", style: TextStyle(color:themeManager.darkTheme ?  AppColors.lastMessageColor : AppColors.darkModeLastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
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
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(AppImages.pic3),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("Aliyah", style: TextStyle(color:themeManager.darkTheme ? Colors.black : Colors.white, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                            Text("Keep working ✍", style: TextStyle(color:themeManager.darkTheme ?  AppColors.lastMessageColor : AppColors.darkModeLastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
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
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(AppImages.pic1),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("John Borino", style: TextStyle(color:themeManager.darkTheme ? Colors.black : Colors.white, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                            Text("Make yourself proud 😍", style: TextStyle(color:themeManager.darkTheme ?  AppColors.lastMessageColor : AppColors.darkModeLastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
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
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(AppImages.pic3),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("Borsha Akther", style: TextStyle(color:themeManager.darkTheme ? Colors.black : Colors.white, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                            Text("Flowers are beautiful 🌸", style: TextStyle(color:themeManager.darkTheme ?  AppColors.lastMessageColor : AppColors.darkModeLastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
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
