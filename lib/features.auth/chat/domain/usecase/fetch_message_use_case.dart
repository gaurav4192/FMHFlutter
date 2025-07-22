import 'package:fluttersocket/features.auth/chat/domain/entity/MessageResponseModel.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/message_entity.dart';
import 'package:fluttersocket/features.auth/chat/domain/repositories/message_repository.dart';

class FetchMessageUseCase{
  final MessageRepository messageRepository;
  FetchMessageUseCase({required this.messageRepository});


  Future<MessageResponseModel> call(String conversationId) async{
    return await messageRepository.fetchMessages(conversationId);
  }
}
