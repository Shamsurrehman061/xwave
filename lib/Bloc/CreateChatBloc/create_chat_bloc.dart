


import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../../Models/CreateChatModel/Create_chat_model.dart';
import '../../Repository/LoginRepository/Network/network.dart';
import '../../Res/AppUrls/app_urls.dart';
import '../../Utils/LocalDb/user_local_date.dart';
import '../AuthBloc/SendOtpBloc/send_otp_events.dart';

import 'create_chat_events.dart';
import 'create_chat_states.dart';


class CreateChatBloc extends Bloc<CreateChatEvents, CreateChatStates>{

  CreateChatBloc() : super(CreateChatInitialState()){
    on<CreateChat>(createChat);
  }

  FutureOr<void> createChat(CreateChat event, Emitter<CreateChatStates> emit) async{


    Network network = Network();
    UserData userData = UserData();
    List<CreateChatModel> createChatData = [];
    createChatData.clear();
    print("get token executed");
    var token = "";
    try{

      token =await userData.getUserToken();
      final body = jsonEncode({
        "userId": event.channel,
      });

      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final result =await network.getPosthWithHeader(AppUrls.getCreateChat, body, header);
      createChatData.add(CreateChatModel.fromJson(result));

      emit(CreateChatSuccessState(createdChatData: createChatData));
    }
    catch(e)
    {
      emit(CreateChatErrorState(error: e.toString()));
    }


  }
}