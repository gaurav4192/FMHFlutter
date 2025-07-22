

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/MessageResponseModel.dart';
import 'package:fluttersocket/features.auth/chat/domain/usecase/fetch_message_use_case.dart';
import 'package:fluttersocket/features.auth/chat/presentation/bloc/chat_event.dart';
import 'package:fluttersocket/features.auth/chat/presentation/bloc/chat_state.dart';

import '../../../../resources/socket_service.dart';

class ChatBloc extends Bloc<ChatEvent,ChatState>{

  final FetchMessageUseCase fetchMessageUseCase;
  final SocketService _socketService =SocketService();
  final List<Data> _message=[];

  final _storage=FlutterSecureStorage();

  ChatBloc({required this.fetchMessageUseCase}):super(ChatLoadingState()){

    on<LoadMessageEvent>(_onLoadMessageEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
    on<ReceivedMessageEvent>(_onReceiveMessageEvent);

  }

  Future<void> _onLoadMessageEvent(LoadMessageEvent event,Emitter<ChatState> emit) async{
    emit(ChatLoadingState());
    try{
      final messages=await fetchMessageUseCase(event.conversationId);
      _message.clear();

      for(int i =0;i<messages.data!.length;i++)
        {
          _message.add(messages.data![i]);
        }
      emit(ChatLoadedState(_message));
      _socketService.socket.emit('join conversation',event.conversationId);
      _socketService.socket.on('newMessage', (data){
        // print("step1-received :$data");
        // add(ReceivedMessageEvent(messageResponseModel: data));
        final decodedData = data is String ? jsonDecode(data) : data;

        final messageModel = MessageResponseModel.fromJson(decodedData);

        add(ReceivedMessageEvent(messageResponseModel: messageModel));
      });

    }
    catch(error){
      emit(ChatErrorState(message: 'Failed to load messages'));
    }
  }

  Future<void> _onSendMessageEvent(SendMessageEvent event,Emitter<ChatState> emit) async{

    String userId=await _storage.read(key: 'userId')?? '';
    
    print('userId:$userId');
    final newMessage={
      'conversationId':event.conversationId,
      'content':event.content,
      'senderId':userId

    };

    _socketService.socket.emit('sendMessage',newMessage);

  }

  Future<void> _onReceiveMessageEvent(ReceivedMessageEvent event,Emitter<ChatState> emit) async{
    print("step2-received event called");
    print(event.messageResponseModel.data?[0].toString());
    // final newmessage=Data(
    //     id: event.messageResponseModel.data?[0].id,
    //     conversationId: event.messageResponseModel.data?[0].conversationId,
    //     senderId: event.messageResponseModel.data?[0].senderId,
    //     content:event.messageResponseModel.data?[0].content,
    //     createdAt:event.messageResponseModel.data?[0].createdAt
    //
    // );
     // MessageResponseModel messageResponseModel=new MessageResponseModel.fromJson(newmessage);

     _message.add(event.messageResponseModel.data![0]);
     emit(ChatLoadedState(_message));
  }



}