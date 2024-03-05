
abstract class ProfileInfoStates{}


class ProfileInfoError extends ProfileInfoStates{

  final String error;

  ProfileInfoError({required this.error});
}

class ProfileInitialState extends ProfileInfoStates{}

class ProfileLoadingState extends ProfileInfoStates{}

class ProfileInfoSuccessState extends ProfileInfoStates{}