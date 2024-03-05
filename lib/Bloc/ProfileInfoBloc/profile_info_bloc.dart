
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:x_wave/Bloc/ProfileInfoBloc/profile_info_event.dart';
import 'package:x_wave/Bloc/ProfileInfoBloc/profile_info_state.dart';
import 'package:x_wave/Repository/LoginRepository/Network/network.dart';
import 'package:x_wave/Res/AppUrls/app_urls.dart';

import '../../Models/UserProfileData/user_profile_data.dart';
import '../../Utils/LocalDb/login_session.dart';
import '../../Utils/LocalDb/user_local_date.dart';
import '../../Utils/LocalDb/user_profile_data.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoStates>{

  ProfileInfoBloc() : super(ProfileInitialState()){

    on<SubmitProfileData>(submitProfileData);
    on<GetProfileDats>(getProfileData);

  }


  FutureOr<void> submitProfileData(SubmitProfileData event, Emitter<ProfileInfoStates> emit)async{

    emit(ProfileLoadingState());
    Network network = Network();
    UserData userData = UserData();
    LoginSession loginSession = LoginSession();


    try{
      var map = Map<dynamic, dynamic>();
      map['username'] = event.username;
      map['infoAbout'] = event.about;
      map['phoneNumber'] = event.phoneNumber;
      map['avatar'] = event.imagePath;

      final result =await network.getPosthWithMultipart(AppUrls.profileInfoUrl, map);






      if(result['status'] == 'success')
        {
          userData.saveUserToken(result['token']);
          userData.saveUserUid(result['userData']['_id']);
          loginSession.saveLoginSession(true);
          emit(ProfileInfoSuccessState());
        }

    }
    catch(e)
    {
      emit(ProfileInfoError(error: e.toString()));
    }

  }

  FutureOr<void> getProfileData(GetProfileDats event, Emitter<ProfileInfoStates> emit) async{

    Network network = Network();
    UserData userData = UserData();
    UserProfileData userProfileData = UserProfileData();


    try{

      final token =await userData.getUserToken();
      var header = {
        'Authorization': 'Bearer $token',
      };

      final result = await network.getApi(AppUrls.getProfileInfoUrl, header);
      print(result);


     await userProfileData.addData(
        UserProfileDataHive(
            username: result['userData']['username'],
            phoneNumber: result['userData']['phoneNumber'],
            avatar: result['userData']['avatar'],
            userId: result['userData']['user_id'],
            info: result['userData']['infoAbout'],
        ),
      );

    }
    catch(e)
    {
      print(e);
    }

  }
}