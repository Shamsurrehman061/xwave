abstract class SendOtpEvent{}


class SendOtp extends SendOtpEvent{

  final String phoneNumber;
  SendOtp({required this.phoneNumber});
}