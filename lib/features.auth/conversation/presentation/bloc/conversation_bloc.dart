import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/features.auth/conversation/domain/usecase/fetch_conversations_use_case.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversation_state.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversations_event.dart';
import 'package:fluttersocket/resources/socket_service.dart';

class ConversationsBloc extends Bloc<ConversationsEvent,ConversationsState>{

  final FetchConversationsUseCase fetchConversations;

  final SocketService _socketService=SocketService();
  ConversationsBloc({required this.fetchConversations}):super(ConversationInitial()){

    on<FetchConversations>(_onFetchConversations);

    _intializeSocketListener();
  }

  void _intializeSocketListener(){
    try{
      _socketService.socket.on('conversationUpdated',_onConversationUpdated);
    }
    catch(e){
      print('Error Intializing Socket Listener :$e');
    }
  }

  Future<void> _onFetchConversations(FetchConversations event,Emitter<ConversationsState> emit) async{

    emit(ConversationLoading());
        try
      {
        final conversations= await fetchConversations();
        emit(ConversationLoaded(conversationResponseModel: conversations));
      }
      catch(error){

      }

  }

  void _onConversationUpdated(data){
    add(FetchConversations());
  }

}