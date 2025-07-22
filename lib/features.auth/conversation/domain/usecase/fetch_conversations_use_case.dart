import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';
import 'package:fluttersocket/features.auth/conversation/domain/repositories/converations_repository.dart';

class FetchConversationsUseCase{
  final ConversationsRepository repository;
  FetchConversationsUseCase(this.repository);


 Future<ConversationResponseModel> call() async{
   return repository.fetchConversations();
 }
}