


import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_events.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_states.dart';
import 'package:http/http.dart' as http;
import 'package:x_wave/Bloc/AuthBloc/VerifyOtpBloc/verify_otp_event.dart';
import 'package:x_wave/Bloc/AuthBloc/VerifyOtpBloc/verify_otp_state.dart';
import 'package:x_wave/Models/RegisterationModel/Registeration_model.dart';
import 'package:x_wave/Utils/LocalDb/user_local_date.dart';
import '../../../Models/UserProfileData/user_profile_data.dart';
import '../../../Models/VerifyOtpModel/Verify_otp_model.dart';
import '../../../Repository/LoginRepository/Network/network.dart';
import '../../../Res/AppUrls/app_urls.dart';
import '../../../Utils/Initializer/initializer.dart';
import '../../../Utils/LocalDb/login_session.dart';
import '../../../Utils/LocalDb/user_profile_data.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpStates>{

  VerifyOtpBloc() : super(VerifyOtpInitialState()){

    on<VerifyOtp>(verifyOtp);

  }



  FutureOr<void> verifyOtp(VerifyOtp event, Emitter<VerifyOtpStates> emit) async{

    emit(VerifyOtpLoadingState());
    UserData userData = UserData();
    Network network = Network();
    LoginSession loginSession = LoginSession();



    try{
      final body = {
        "phoneNumber": event.phoneNumber,
        "otp": event.otp,
      };

      print(body);
      final result =await network.getPost(AppUrls.verifyOtpUrl, body);

      if(result['status'] == "success")
      {
        if(result['newUser'] == true)
          {
            emit(VerifyNewUserOtpSuccessState(registerationModel: RegisterationModel.fromJson(result)));
          }
        else
          {
            userData.saveUserToken(result['token']);
            userData.saveUserUid(result['user_id']);
            userData.saveUserContact(result['phoneNumber']);
            loginSession.saveLoginSession(true);

            emit(VerifyOtpSuccessState(verifyOtpModel: VerifyOtpModel.fromJson(result)));
          }
      }
    }
    catch(e)
    {
      if(e is Exception)
        {
          emit(VerifyOtpErrorState(error: e.toString()));
        }
      else
        {
          emit(VerifyOtpErrorState(error: e.toString()));
        }


    }


  }
}