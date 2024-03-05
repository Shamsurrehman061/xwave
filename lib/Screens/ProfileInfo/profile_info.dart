import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Bloc/ProfileInfoBloc/profile_info_bloc.dart';
import '../../Bloc/ProfileInfoBloc/profile_info_event.dart';
import '../../Bloc/ProfileInfoBloc/profile_info_state.dart';
import '../../Controllers/ProfileInfoController/profile_info_controller.dart';
import '../../Res/AppColors/app_colors.dart';
import '../../Utils/Initializer/initializer.dart';
import '../../Utils/ThemeManagement/theme_management.dart';
import '../Auth/PhoneNumberVerified/phone_number_verified.dart';


class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key,});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  ThemeManager darkTheme = ThemeManager();
  Initializer initializer = Get.put(Initializer());

  void _showImageSourceBottomSheet(BuildContext context) {
    final controller = Get.put(ProfileInfoController());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  controller.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  controller.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(ProfileInfoController());

    return Scaffold(
      backgroundColor: darkTheme.darkTheme ? Colors.black : Colors.white,
      body: BlocConsumer<ProfileInfoBloc, ProfileInfoStates>(
        listener: (context, state){
          if(state is ProfileInfoSuccessState)
            {
              initializer.initialize(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PhoneNumberVerification()));
            }
          else if(state is ProfileInfoError)
            {
              Fluttertoast.showToast(msg: state.error);
            }
        },
        builder: (context, state){
          if(state is ProfileLoadingState)
            {
              return Center(child: CircularProgressIndicator(color: AppColors.orangeColor,),);
            }
          else
            {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [

                      SizedBox(
                        height: size.height * 0.05,
                      ),


                      Center(
                        child: InkWell(
                          onTap: (){
                            _showImageSourceBottomSheet(context);
                          },
                          child: Stack(
                            children:
                            [
                              Obx(() => controller.imagePath.value == "" ? CircleAvatar(
                                radius: size.width * 0.3,
                                backgroundColor:darkTheme.darkTheme ? Colors.white : Colors.black,
                              ) : CircleAvatar(
                                radius: size.width * 0.3,
                                backgroundImage: FileImage(File(controller.imagePath.value)),
                              )),

                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.popUpMenuButton,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.edit, color: AppColors.orangeColor,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.05,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("Your Name", style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black),),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            TextFormField(
                              controller: controller.nameController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                hintText: "Full Name..",
                                hintStyle: GoogleFonts.roboto(
                                  color: Color(0xffB9B9B9),
                                  fontSize: 12.sp,
                                ),
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkTheme.darkTheme ? Colors.transparent : Color(0xffD1D1D1),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkTheme.darkTheme ? Colors.transparent : Color(0xffD1D1D1),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkTheme.darkTheme ? Colors.transparent : Color(0xffD1D1D1),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("About", style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black),),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            TextFormField(
                              controller: controller.aboutController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                hintText: "Hye! XWave is an amazing app.",
                                hintStyle: GoogleFonts.roboto(
                                  color: Color(0xffB9B9B9),
                                  fontSize: 12.sp,
                                ),
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkTheme.darkTheme ? Colors.transparent : Color(0xffD1D1D1),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkTheme.darkTheme ? Colors.transparent : Color(0xffD1D1D1),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkTheme.darkTheme ? Colors.transparent : Color(0xffD1D1D1),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text("Phone", style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black),),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.greyColor,),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: CountryCodePicker(
                                      initialSelection: 'US',
                                      favorite: ['+1','en'],
                                      showCountryOnly: false,
                                      showFlagMain: false,
                                      padding: EdgeInsets.all(0.0),
                                      showOnlyCountryWhenClosed: false,
                                      textStyle: GoogleFonts.plusJakartaSans(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      enabled: true,
                                      showFlag: false,
                                      showDropDownButton: true,
                                      backgroundColor: Colors.white,
                                      boxDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(color: AppColors.greyColor),
                                      ),
                                      barrierColor: Colors.transparent,
                                      searchDecoration: InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: AppColors.borderColor,
                                              width: 1
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: AppColors.borderColor,
                                              width: 1
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: AppColors.borderColor,
                                              width: 1
                                          ),
                                        ),
                                      ),
                                      dialogBackgroundColor: Colors.white,
                                      alignLeft: false,
                                      showFlagDialog: true,
                                      onChanged: (value){
                                        controller.countryCode.value = value;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'\s'))
                                    ],
                                    controller: controller.phoneController,
                                    style: GoogleFonts.plusJakartaSans(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      filled: true,
                                      isDense: true,
                                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                      hintText: "Phone Number",
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: AppColors.greyColor,
                                          )
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: AppColors.greyColor,
                                          )
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: AppColors.greyColor,
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.05,
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                          child: SizedBox(
                            width: size.width * 0.25,
                            child: MaterialButton(
                              onPressed: (){
                                BlocProvider.of<ProfileInfoBloc>(context).add(
                                    SubmitProfileData(
                                      username: controller.nameController.text,
                                      about: controller.aboutController.text,
                                      phoneNumber: "${controller.countryCode}${controller.phoneController.text}",
                                      imagePath: controller.imagePath.value ?? '',
                                    )
                                );



                              },
                              height: size.height * 0.055,
                              color: AppColors.orangeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text("Submit", style: TextStyle(),),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              );
            }

        },
      )
    );
  }
}
