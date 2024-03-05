

import '../../Models/PhoneNumbersModel/Phone_number_model.dart';

abstract class PhoneNumberState{}


class PhoneNumberInitialState extends PhoneNumberState{}

class PhoneNumberSuccessState extends PhoneNumberState{
  List<PhoneNumberModel> numberList;

  PhoneNumberSuccessState({required this.numberList});

}

class PhoneNumberErrorState extends PhoneNumberState{

  final String error;

  PhoneNumberErrorState({required this.error});
}

