


import '../../../Models/RegisterationModel/Registeration_model.dart';
import '../../../Models/VerifyOtpModel/Verify_otp_model.dart';

abstract class VerifyOtpStates{}



class VerifyOtpInitialState extends VerifyOtpStates{}
class VerifyOtpLoadingState extends VerifyOtpStates{}
class VerifyOtpErrorState extends VerifyOtpStates{
  final String error;

  VerifyOtpErrorState({required this.error});
}

class VerifyNewUserOtpSuccessState extends VerifyOtpStates{
  RegisterationModel registerationModel;
  VerifyNewUserOtpSuccessState({required this.registerationModel});
}
class VerifyOtpSuccessState extends VerifyOtpStates{
  VerifyOtpModel verifyOtpModel;

  VerifyOtpSuccessState({required this.verifyOtpModel});
}
