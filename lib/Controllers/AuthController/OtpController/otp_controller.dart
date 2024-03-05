import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class OtpController extends GetxController{

  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final fourthController = TextEditingController();
  final fifthController = TextEditingController();
  final sixthController = TextEditingController();


  final firstNode = FocusNode();
  final secondNode = FocusNode();
  final thirdNode = FocusNode();
  final fourthNode = FocusNode();
  final fifthNode = FocusNode();
  final sixthNode = FocusNode();

  final countryCode = CountryCode(code: "+1").obs;

  setOtpInControllers(var value){

    firstController.text = value[0];
    secondController.text = value[1];
    thirdController.text = value[2];
    fourthController.text = value[3];
    fifthController.text = value[4];
    sixthController.text = value[5];

  }


}