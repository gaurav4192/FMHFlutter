import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/features.auth/conversation/domain/usecase/fetch_conversations_use_case.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversation_state.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversations_event.dart';

class ConversationsBloc extends Bloc<ConversationsEvent,ConversationsState>{

  final FetchConversationsUseCase fetchConversations;

  ConversationsBloc({required this.fetchConversations}):super(ConversationInitial()){

    on<FetchConversations>(_onFetchConversations);
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

}