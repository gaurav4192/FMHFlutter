class MessageEntity{

  final String id;
  final String conversationId;
  final String senderId;
  final String content;
  final String created_at;

  MessageEntity({required this.id,
    required this.conversationId,
    required this.senderId,
    required this.content,
    required this.created_at});

}