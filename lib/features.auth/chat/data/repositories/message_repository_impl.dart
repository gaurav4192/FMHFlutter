
import 'package:fluttersocket/features.auth/chat/data/datasources/message_remote_data_source.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/MessageResponseModel.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/message_entity.dart';
import 'package:fluttersocket/features.auth/chat/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository{
  final MessageRemoteDataSource messageRemoteDataSource;

  MessageRepositoryImpl({required this.messageRemoteDataSource});

  @override
  Future<MessageResponseModel> fetchMessages(String converationId) async{
    return await messageRemoteDataSource.fetchMessages(converationId);


  }

  @override
  Future<void> sendMessages(MessageResponseModel message) {
    // TODO: implement sendMessages
    throw UnimplementedError();
  }
  
}