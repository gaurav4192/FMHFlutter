import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';

class ConversationModel extends Data{
  ConversationModel({
    required conversationId,
    required participantName,
    required lastMessage,
    required lastMessageTime,
}):super(

    conversationId: conversationId,
    participantName: participantName,
    lastMessage: lastMessage,
    lastMessageTime: lastMessageTime
  );

  factory ConversationModel.fromJson(Map<String,dynamic>json){

    return ConversationModel(
        conversationId: json['conversation_id'],
        participantName: json['participant_name'],
        lastMessage: json['last_message'],
        lastMessageTime: json['last_message_time']);
  }
}