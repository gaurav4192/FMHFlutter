import 'package:fluttersocket/features.auth/chat/domain/entity/message_entity.dart';

class MessageModel extends MessageEntity{
  MessageModel(
  {
  required String id,
  required String conversationId,
    required String senderId,
    required String content,
    required String createdAt

  }):
      super(
      id: id,
          content: content,
        conversationId: conversationId,
        senderId: senderId,
          created_at: createdAt

      );

  factory MessageModel.fromJson(Map<String,dynamic> json){
    return MessageModel(id: json['id'],
        conversationId: json['conversationId'],
        senderId: json['senderId'],
        content: json['content'],
        createdAt: json['createdAt']);
  }
}