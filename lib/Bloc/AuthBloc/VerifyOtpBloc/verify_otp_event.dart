abstract class VerifyOtpEvent{}


class VerifyOtp extends VerifyOtpEvent{

  final String phoneNumber;
  final String otp;
  VerifyOtp({required this.phoneNumber, required this.otp});
}