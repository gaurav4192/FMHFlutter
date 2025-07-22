import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';

abstract class ConversationsState{}

class ConversationInitial extends ConversationsState{}

class ConversationLoading extends ConversationsState{}

class ConversationLoaded extends ConversationsState{

  final ConversationResponseModel conversationResponseModel;
  ConversationLoaded({required this.conversationResponseModel});
}

class ConversationError extends ConversationsState{

  final String message;
  ConversationError({required this.message});
}