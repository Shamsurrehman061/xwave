import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_wave/Bloc/AuthBloc/VerifyOtpBloc/verify_otp_event.dart';
import 'package:x_wave/Controllers/ProfileInfoController/profile_info_controller.dart';
import 'package:x_wave/Screens/HomeScreen/home_screen.dart';
import 'package:x_wave/Screens/ProfileInfo/profile_info.dart';

import '../../../Bloc/AuthBloc/VerifyOtpBloc/verify_otp_bloc.dart';
import '../../../Bloc/AuthBloc/VerifyOtpBloc/verify_otp_state.dart';
import '../../../Controllers/AuthController/OtpController/otp_controller.dart';
import '../../../Res/AppColors/app_colors.dart';
import '../../../Utils/Initializer/initializer.dart';
import '../../../Utils/ThemeManagement/theme_management.dart';
import '../LoginScreen/login_screen.dart';
import '../PhoneNumberVerified/phone_number_verified.dart';


class OtpScreen extends StatefulWidget {
   OtpScreen({super.key, required this.otp, required this.number});

   final String otp;
   final String number;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
   ThemeManager themeManager = ThemeManager();

   bool isLoading = false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
   Initializer initializer = Get.put(Initializer());




  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    final controller = Get.put(OtpController());
    final profileInfoController = Get.put(ProfileInfoController());

    return Scaffold(
      backgroundColor: themeManager.darkTheme ? Colors.black : Colors.white,
      body: BlocConsumer<VerifyOtpBloc, VerifyOtpStates>(
        listener: (context, state){
          if(state is VerifyOtpErrorState)
            {
              Fluttertoast.showToast(msg: state.error);
            }
          else if(state is VerifyOtpSuccessState)
            {
              initializer.initialize(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          else if(state is VerifyNewUserOtpSuccessState)
            {
              profileInfoController.phoneController.text = state.registerationModel.phoneNumber.toString();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileInfoScreen()));
            }
        },
        builder: (context, state){
          if(state is VerifyOtpLoadingState)
            {
              return Center(child: CircularProgressIndicator(color: AppColors.orangeColor,),);
            }
          else
            {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.02),
                  child: Stack(
                    alignment: Alignment.center,
                    children:
                    [
                      Column(
                        children:
                        [
                          Row(
                            children:
                            [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.orangeColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.white,),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 7,
                                  child: Text("Phone Verification", textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                  ),)),
                              Expanded(
                                  flex: 1,
                                  child: Container()),
                            ],
                          ),

                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text("Enter 6 digit verification code sent to your phone number", style: GoogleFonts.plusJakartaSans(
                            color:  themeManager.darkTheme ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                          ),),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Row(
                            children:
                            [
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: controller.firstController,
                                  focusNode: controller.firstNode,
                                  onChanged: (value){
                                    if(controller.firstController.text.length == 1)
                                    {
                                      FocusScope.of(context).requestFocus(controller.secondNode);
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),),
                              SizedBox(width: size.width * 0.02,),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: controller.secondController,
                                  focusNode: controller.secondNode,
                                  onChanged: (value){
                                    if(controller.secondController.text.length == 1)
                                    {
                                      FocusScope.of(context).requestFocus(controller.thirdNode);
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),),
                              SizedBox(width: size.width * 0.02,),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: controller.thirdController,
                                  focusNode: controller.thirdNode,
                                  onChanged: (value){
                                    if(controller.thirdController.text.length == 1)
                                    {
                                      FocusScope.of(context).requestFocus(controller.fourthNode);
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),),
                              SizedBox(width: size.width * 0.02,),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: controller.fourthController,
                                  focusNode: controller.fourthNode,
                                  onChanged: (value){
                                    if(controller.fourthController.text.length == 1)
                                    {
                                      FocusScope.of(context).requestFocus(controller.fifthNode);
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),),
                              SizedBox(width: size.width * 0.02,),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: controller.fifthController,
                                  focusNode: controller.fifthNode,
                                  onChanged: (value){
                                    if(controller.fifthController.text.length == 1)
                                    {
                                      FocusScope.of(context).requestFocus(controller.sixthNode);
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),),
                              SizedBox(width: size.width * 0.02,),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: controller.sixthController,
                                  focusNode: controller.sixthNode,
                                  onChanged: (value){
                                    if(controller.sixthController.text.length == 1)
                                    {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        isLoading = !isLoading;
                                      });
                                      Future.delayed(Duration(seconds: 3), (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PhoneNumberVerification()));
                                      });
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.plusJakartaSans(
                                    color:  themeManager.darkTheme ? Colors.white : Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color:  themeManager.darkTheme ? Colors.white.withOpacity(0.2) : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),

                          InkWell(
                            onTap: (){
                              BlocProvider.of<VerifyOtpBloc>(context).add(
                                  VerifyOtp(phoneNumber: widget.number, otp: widget.otp)
                              );
                            },
                            child: Text("Verify Otp", textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(
                              color: AppColors.orangeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),),
                          ),

                          SizedBox(
                            height: size.height * 0.04,
                          ),

                          Text("Resend Code", textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(
                            color: AppColors.orangeColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),),
                        ],
                      ),

                      Positioned(
                        child:isLoading ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            color: AppColors.orangeColor,
                          ),
                        ) : Container(),
                      )
                    ],
                  ),
                ),
              );
            }
        },
      ),
    );
  }
}
