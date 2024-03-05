




import 'package:get/get.dart';

class PhoneNumberController extends GetxController{


  final numberList = [].obs;


  fetchNumbers(var value){
    numberList.add(value);
  }

  clearList()
  {
    numberList.clear();
  }

  getNumbers()
  {
    return numberList;
  }
}