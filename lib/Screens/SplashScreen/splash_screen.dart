import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:x_wave/Screens/Auth/LoginScreen/login_screen.dart';
import 'package:x_wave/Utils/ThemeManagement/theme_management.dart';

import '../../Res/AppColors/app_colors.dart';
import '../../Res/ImagesUrl/images_url.dart';
import '../../Utils/LocalDb/login_session.dart';
import '../HomeScreen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeManager themeManager = ThemeManager();
  LoginSession loginSession = LoginSession();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chechSession();
  }

  chechSession()async
  {
    if(loginSession.box.isNull)
    {
      Get.to(LoginScreen());
    }
    else if(await loginSession.getLoginSession())
    {
      Get.to(HomeScreen());
    }

  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.popUpMenuButton,
      body: SafeArea(
          child: SizedBox(
            height: size.height * 1,
              width: size.width * 1,
              child: Lottie.asset("assets/SplashScreenGif/splash_anim.json", fit: BoxFit.scaleDown)),
      ),
    );
  }
}
