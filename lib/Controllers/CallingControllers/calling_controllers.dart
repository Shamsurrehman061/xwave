

import 'package:get/get.dart';

class CallingController extends GetxController{

  final dropVideoScreen = false.obs;


  setCallStatus(final status)
  {
    dropVideoScreen.value = status;
  }

  getVideoStatus()
  {
    return dropVideoScreen.value;
  }

}