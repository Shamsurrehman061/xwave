


import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_wave/Utils/PickMedia/pick_media.dart';

class ProfileInfoController extends GetxController{

  PickMedia pickMedia = PickMedia();

  final imagePath = ''.obs;

  final nameController = TextEditingController();
  final aboutController = TextEditingController();
  final phoneController = TextEditingController();
  final countryCode = CountryCode(code: "+1").obs;



  getImage(ImageSource source)async
  {
    // final image =await ImagePicker().pickImage(source: source);
    //
    // if(image != null)
    //   {
    //     imagePath.value = image.path;
    //   }
    imagePath.value =await pickMedia.getProfileImage(source);
  }




}