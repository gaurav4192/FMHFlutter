
import 'package:fluttersocket/features.auth/conversation/data/datasources/conversations_remote_data_source.dart';
import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';
import 'package:fluttersocket/features.auth/conversation/domain/repositories/converations_repository.dart';

class ConversationRepositoryImpl extends ConversationsRepository
{
  final ConversationsRemoteDataSource conversationsRemoteDataSource;

  ConversationRepositoryImpl({required this.conversationsRemoteDataSource});

  @override
  Future<ConversationResponseModel> fetchConversations() async {

    return await conversationsRemoteDataSource.fetchConversation();
  }

}