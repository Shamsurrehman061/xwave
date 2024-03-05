
abstract class CreateChatEvents{}


class CreateChat extends CreateChatEvents{

  final String channel;

  CreateChat({required this.channel});

}