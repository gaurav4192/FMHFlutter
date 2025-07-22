import 'package:fluttersocket/features.auth/chat/domain/entity/MessageResponseModel.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/message_entity.dart';

abstract class MessageRepository{
  Future<MessageResponseModel> fetchMessages(String converationId);
  Future<void> sendMessages(MessageResponseModel message);

}