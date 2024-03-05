import 'package:flutter/cupertino.dart';

import '../../../Models/SendOtpModel/send_otp_model.dart';

abstract class SendOtpStates{}



class SendOtpInitialState extends SendOtpStates{}
class SendOtpLoadingState extends SendOtpStates{}
class SendOtpErrorState extends SendOtpStates{
  final String error;

  SendOtpErrorState({required this.error});
}
class SendOtpSuccessState extends SendOtpStates{
  SendOtpModel sendOtpModel;

  SendOtpSuccessState({required this.sendOtpModel});
}
