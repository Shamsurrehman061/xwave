import 'dart:ffi';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_bloc.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_events.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_states.dart';
import 'package:x_wave/Controllers/AuthController/OtpController/otp_controller.dart';
import 'package:x_wave/Screens/Auth/OtpScreen/otp_screen.dart';

import 'package:x_wave/Utils/ThemeManagement/theme_management.dart';

import '../../../Res/AppColors/app_colors.dart';
import '../../../Res/IconsUrl/icons.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ThemeManager darkTheme = ThemeManager();
  final phoneNumberController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(OtpController());
    return Scaffold(
      backgroundColor: darkTheme.darkTheme ? Colors.black : Colors.white,
      body: BlocConsumer<SendOtpBloc, SendOtpStates>(
        listener: (BuildContext context, SendOtpStates state){
          if(state is SendOtpErrorState)
            {
              Fluttertoast.showToast(msg: state.error);
            }
          else if(state is SendOtpSuccessState)
            {
              controller.setOtpInControllers(state.sendOtpModel.otp);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpScreen(otp: state.sendOtpModel.otp!, number: '${controller.countryCode.value.dialCode}${phoneNumberController.text}',)));
            }
        },
        builder: (context, state){
          if(state is SendOtpLoadingState)
            {
              return Center(child: CircularProgressIndicator(
                color: AppColors.orangeColor,
              ),);
            }
          else
            {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children:
                    [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: size.width * 0.25,
                          child: FlutterSwitch(
                            height: 32,
                            width: 55,
                            value: darkTheme.darkTheme,
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
                              darkTheme.switchTheme();
                              setState((){
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.4,
                      ),

                      Column(
                        children:
                        [
                          Container(
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: AppColors.loginContainerColor
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children:
                              [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Center(child: Text("Login to Your Account", style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),)),
                                SizedBox(
                                  height: size.height * 0.035,
                                ),
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    hintText: "Phone Number",
                                    //hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                    hintStyle: GoogleFonts.plusJakartaSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: size.height * 0.035,
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
                                          backgroundColor: Colors.black,
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
                                          dialogBackgroundColor: Colors.black,
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
                                        controller: phoneNumberController,
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          filled: true,
                                          isDense: true,
                                          hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                          hintText: "Phone Number",
                                          fillColor: Colors.transparent,
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


                                SizedBox(
                                  height: size.height * 0.035,
                                ),
                                MaterialButton(
                                  onPressed: (){

                                    if(!phoneNumberController.text.isNotEmpty)
                                      {
                                        Fluttertoast.showToast(msg: "Phone Number is required");
                                      }
                                    else
                                    {

                                      BlocProvider.of<SendOtpBloc>(context).add(
                                          SendOtp(
                                              phoneNumber: "${controller.countryCode.value.dialCode}${phoneNumberController.text}",
                                          ));
                                    }
                                  },
                                  height: size.height * 0.06,
                                  color: AppColors.orangeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text("Send OTP", style: TextStyle(),),
                                ),

                                SizedBox(
                                  height: size.height * 0.04,
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: size.height * 0.02,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              SvgPicture.asset(AppIcons.logo),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text("XWave", style: GoogleFonts.poppins(
                                color: darkTheme.darkTheme ? Colors.white :Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
                        ],
                      ),
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
