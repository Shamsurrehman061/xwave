import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_wave/Screens/HomeScreen/home_screen.dart';
import 'package:x_wave/Utils/ThemeManagement/theme_management.dart';

import '../../../Res/ImagesUrl/images_url.dart';


class PhoneNumberVerification extends StatefulWidget {
  PhoneNumberVerification({super.key});

  @override
  State<PhoneNumberVerification> createState() => _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  ThemeManager _themeManager = ThemeManager();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3,), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _themeManager.darkTheme ? Colors.black : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Center(child: SvgPicture.asset(AppImages.verificationDoneLogoDark)),

            SizedBox(
              height: size.height * 0.07,
            ),

            Center(child: Text("Phone Number Verified", style: GoogleFonts.plusJakartaSans(
              color: _themeManager.darkTheme ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 25.sp,
            ),),),
            SizedBox(
              height: size.height * 0.03,
            ),

            Center(
              child: Text("You will be redirected to the main page in a few moments", textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(
                color: _themeManager.darkTheme ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400,
                height: 1.5,
                fontSize: 14.sp,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
