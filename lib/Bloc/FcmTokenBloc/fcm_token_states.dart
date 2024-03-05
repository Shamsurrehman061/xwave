abstract class FcmTokenStates{}


class InitialStates extends FcmTokenStates{}
class SuccessState extends FcmTokenStates{
  final String token;

  SuccessState({required this.token});
}
