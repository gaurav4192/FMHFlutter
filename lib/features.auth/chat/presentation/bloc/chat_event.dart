import '../../domain/entity/MessageResponseModel.dart';

abstract class ChatEvent{}


class LoadMessageEvent extends ChatEvent{

  final String conversationId;
  LoadMessageEvent(this.conversationId);


}

class SendMessageEvent extends ChatEvent{
  final String conversationId;
  final String content;

  SendMessageEvent({required this.conversationId,required this.content});


}

class ReceivedMessageEvent extends ChatEvent{
  final MessageResponseModel messageResponseModel;
  ReceivedMessageEvent({required this.messageResponseModel});
}