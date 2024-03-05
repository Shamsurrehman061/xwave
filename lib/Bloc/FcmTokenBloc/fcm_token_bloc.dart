



import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_wave/Repository/LoginRepository/Network/network.dart';
import 'package:x_wave/Utils/NotificationServices/notification_services.dart';

import '../../Res/AppUrls/app_urls.dart';
import '../../Utils/LocalDb/user_local_date.dart';
import 'fcm_token_events.dart';
import 'fcm_token_states.dart';


String fcmToken = "";
String saveFcmToken22 = "";

class FcmTokenBloc extends Bloc<FcmTokenEvents,FcmTokenStates>{

  FcmTokenBloc() : super(InitialStates()){

    on<GetFcmToken>(getFcm);
    on<SaveFcmToken>(saveFcmToken);

  }


  FutureOr<void> getFcm(GetFcmToken event, Emitter<FcmTokenStates> emit) async{

    Network network = Network();
    UserData userData = UserData();
    var token = "";
    token =await userData.getUserToken();
    final userId = await userData.getUserUid();

    try{

      final body = <String, dynamic>{
        "userID":"$userId",
      };

      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Uri url = Uri.parse(AppUrls.getFcmToken);
      final uri = url.replace(queryParameters: body);
      final result = await network.getApi("${AppUrls.getFcmToken}/$userId", header);
      final fetchToken = result['fcmToken'];
      fcmToken = fetchToken;
      print(fcmToken);
      emit(SuccessState(token: fetchToken));
    }
    catch(e)
    {
      print(e);
    }

  }


  FutureOr<void> saveFcmToken(SaveFcmToken event, Emitter<FcmTokenStates> emit) async{


    Network network = Network();
    UserData userData = UserData();
    final notificationToken = await NotificationServices().getFcmToken();
    var token = "";
    saveFcmToken22 = notificationToken;
    token =await userData.getUserToken();

    print(notificationToken);
    try{
      final userid = await userData.getUserUid();
      final body = jsonEncode({
        "userID": userid,
        "fcmToken": notificationToken,
        "serverKey":"ewqeqwewqewqewq"
      });

      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final result = await network.getPosthWithHeader(AppUrls.saveFcmToken, body, header);
      print(result);

    }
    catch(e)
    {
      print(e);
    }


  }
}