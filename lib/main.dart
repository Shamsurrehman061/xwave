import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:x_wave/Bloc/ProfileInfoBloc/profile_info_bloc.dart';
import 'package:x_wave/Utils/LocalDb/login_session.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'Bloc/AuthBloc/SendOtpBloc/send_otp_bloc.dart';
import 'Bloc/AuthBloc/VerifyOtpBloc/verify_otp_bloc.dart';
import 'Bloc/CreateChatBloc/create_chat_bloc.dart';
import 'Bloc/FcmTokenBloc/fcm_token_bloc.dart';
import 'Bloc/InternetConnectivityBloc/internet_connectivity_bloc.dart';
import 'Bloc/InternetConnectivityBloc/internet_connectivity_events.dart';
import 'Bloc/InternetConnectivityBloc/internet_connectivity_states.dart';
import 'Bloc/PhoneNumbersBloc/phone_numbers_bloc.dart';

import 'Models/PhoneNumberModelForHive/hive_phone_number_model.dart';

import 'Models/UserProfileData/user_profile_data.dart';
import 'Screens/Auth/LoginScreen/login_screen.dart';
import 'Screens/Auth/OtpScreen/otp_screen.dart';
import 'Screens/BlockUserList/block_user_list.dart';
import 'Screens/Chat/chat.dart';
import 'Screens/CheckingCalling/checking_calling.dart';
import 'Screens/CreatingGroupScreen/creating_group.dart';
import 'Screens/HelpCenterScreen/help_center_screen.dart';
import 'Screens/HomeScreen/home_screen.dart';
import 'Screens/OnGoingVideoCall/on_going_video_call.dart';
import 'Screens/ProfileInfo/profile_info.dart';
import 'Screens/ProfileScreen/profile_screen.dart';
import 'Screens/SelectContactScreen/select_contact_screen.dart';
import 'Screens/SplashScreen/splash_screen.dart';
import 'Screens/UserProfile/user_profile_screen.dart';
import 'Screens/VoiceAnimation/voice_animation.dart';
import 'Screens/ZegoCallInvitation/zego_call_invitation.dart';
import 'Utils/Initializer/initializer.dart';
import 'Utils/LocalDb/user_local_date.dart';
import 'Utils/NotificationServices/notification_services.dart';
import 'Utils/ThemeManagement/theme_management.dart';
import 'firebase_options.dart';

ThemeManager themeManager = ThemeManager();
Box? box;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  await Hive.initFlutter();
  Hive.registerAdapter(hivePhoneNumberModel());
  Hive.registerAdapter(userProfileDataHive());
  box = await Hive.openBox("easyTheme");
  await Hive.openBox("userToken");
  await Hive.openBox<bool>("loginSession");
  await Hive.openBox<UserProfileDataHive>("UserProfileData");
  await Hive.openBox<PhoneNumberModelForHive>("PhoneContacts");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Initializer initializer = Get.put(Initializer());

  @override
  void dispose() {
    // TODO: implement dispose
    themeManager.removeListener(themeListener);
    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    themeManager.addListener(themeListener);
    super.initState();

  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => SendOtpBloc()),
        BlocProvider(create: (context) => VerifyOtpBloc()),
        BlocProvider(create: (context) => ProfileInfoBloc()),
        BlocProvider(create: (context) => PhoneNumbersBloc()),
        //BlocProvider(create: (context) => NetworkBloc()),
        BlocProvider(create: (context) => CreateChatBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: GetMaterialApp(
              title: 'Flutter Demo',
              darkTheme: ThemeData.dark(),
              themeMode: themeManager.currentTheme(),
              theme: ThemeData.light(),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              //home: AnimatedSoundButton(child: Icon(Icons.mic),),
              // home: BlocProvider<SocketObserverBloc>(
              //   create: (context) => SocketObserverBloc(),
              //   child: BlocListener<SocketObserverBloc,SocketObserverStates>(
              //     child: BlocProvider(
              //       create: (context) => NetworkBloc()..add(NetworkObserve()),
              //       child: BlocListener<NetworkBloc, NetworkState>(
              //         listener: (context, state) {
              //           if (state is NetworkFailure) {
              //             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //                 content: Text("No Internet Connection")));
              //           } else if (state is NetworkSuccess) {
              //             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //                 content: Text("You're Connected to Internet")));
              //           } else {const SizedBox.shrink();}
              //         },
              //       ),
              //     ),
              //   ),
              // ),
            ),
          );
        },
      ),
    );


  }
}


