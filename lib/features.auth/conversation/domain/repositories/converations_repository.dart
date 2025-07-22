
import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';

abstract class ConversationsRepository{
  Future<ConversationResponseModel> fetchConversations();
}