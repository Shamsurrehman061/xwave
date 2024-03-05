


import 'dart:io';

abstract class ProfileInfoEvent{}


class SubmitProfileData extends ProfileInfoEvent{

  final String username;
  final String about;
  final String phoneNumber;
  final String imagePath;

  SubmitProfileData({required this.username, required this.about, required this.phoneNumber,required this.imagePath});


}


class GetProfileDats extends ProfileInfoEvent{}




