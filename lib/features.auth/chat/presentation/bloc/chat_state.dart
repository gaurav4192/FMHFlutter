import 'package:fluttersocket/features.auth/chat/domain/entity/MessageResponseModel.dart';

abstract class ChatState{}

class ChatLoadingState extends ChatState{}

class ChatLoadedState extends ChatState{

  // final MessageResponseModel messageResponseModel;
  // ChatLoadedState({required this.messageResponseModel});
  final  List<Data> message;
  ChatLoadedState(this.message);
}

class ChatErrorState extends ChatState{

  final String message;
  ChatErrorState({required this.message});

}