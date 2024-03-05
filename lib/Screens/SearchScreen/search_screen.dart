import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/IconsUrl/icons.dart';
import '../../Res/ImagesUrl/images_url.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final searchTextFormField = TextEditingController();
  final focusNode = FocusNode();

  bool isEnableCalled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!isEnableCalled){
      FocusScope.of(context).requestFocus(focusNode);
      isEnableCalled = true;
    }
    final size = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children:
              [

                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  onTapOutside: (value){
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  focusNode: focusNode,
                  controller: searchTextFormField,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    filled: true,
                    prefixIcon: SvgPicture.asset(AppIcons.homeSearchIcon, color: Colors.black, fit: BoxFit.scaleDown, height: size.height * 0.02,),
                    hintText: "Write your message",
                    hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 12.sp),
                    suffixIcon: searchTextFormField.text.length > 0 ? InkWell(
                        onTap: (){
                          setState(() {
                            searchTextFormField.clear();
                          });
                        },
                        child: SvgPicture.asset(AppIcons.videoCallScreenCrossIcon,color: Colors.black, fit: BoxFit.scaleDown,)) : Icon(Icons.add, color: Colors.transparent,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fillColor: AppColors.textFieldColor,
                  ),
                  cursorColor: AppColors.orangeColor,
                  onChanged: (value){
                    setState(() {
                    });
                  },
                ),


                SingleChildScrollView(
                  child: searchTextFormField.text.length > 0 ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [


                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      Text("People", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      Row(
                        children:
                        [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(AppImages.pic3),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("Borsha Akther", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                              Text("Flowers are beautiful 🌸", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      Row(
                        children:
                        [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(AppImages.pic1),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("Adil Adnan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                              Text("Flowers are beautiful 🌸", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      Row(
                        children:
                        [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(AppImages.pic2),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text("John Borino", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                              Text("Flowers are beautiful 🌸", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.04,
                      ),

                      Text("Group Chat", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      Row(
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
                              Text("Adil Adnan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.sp,),),
                              Text("Flowers are beautiful 🌸", style: TextStyle(color: AppColors.lastMessageColor, fontWeight: FontWeight.w300, fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ) : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
