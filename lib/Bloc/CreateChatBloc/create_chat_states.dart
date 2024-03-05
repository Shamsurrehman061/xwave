import '../../Models/CreateChatModel/Create_chat_model.dart';

abstract class CreateChatStates{}


class CreateChatInitialState extends CreateChatStates{}
class CreateChatLoadingState extends CreateChatStates{}
class CreateChatErrorState extends CreateChatStates{
  final String error;

  CreateChatErrorState({required this.error});
}
class CreateChatSuccessState extends CreateChatStates{
  final List<CreateChatModel> createdChatData;
  CreateChatSuccessState({required this.createdChatData});
}
