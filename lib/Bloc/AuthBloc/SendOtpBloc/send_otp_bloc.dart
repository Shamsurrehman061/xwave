


import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_events.dart';
import 'package:x_wave/Bloc/AuthBloc/SendOtpBloc/send_otp_states.dart';
import 'package:http/http.dart' as http;
import 'package:x_wave/Models/SendOtpModel/send_otp_model.dart';
import '../../../Repository/LoginRepository/Network/network.dart';
import '../../../Res/AppUrls/app_urls.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpStates>{

  SendOtpBloc() : super(SendOtpInitialState()){

    on<SendOtp>(sendOtp);


  }



  FutureOr<void> sendOtp(SendOtp event, Emitter<SendOtpStates> emit) async{

    emit(SendOtpLoadingState());
    Network network = Network();
    SendOtpModel sendOtpModel = SendOtpModel();



    try{
      final body = {
        "phoneNumber": event.phoneNumber,
      };

      final result =await network.getPost(AppUrls.sendOtpUrl, body);

      if(result['status'] == "success")
        {
          emit(SendOtpSuccessState(sendOtpModel: SendOtpModel.fromJson(result)));
        }
    }
    catch(e)
    {
      emit(SendOtpErrorState(error: e.toString()));
    }


  }
}