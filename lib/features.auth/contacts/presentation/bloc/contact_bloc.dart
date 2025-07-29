
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/features.auth/chat/domain/usecase/fetch_message_use_case.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/bloc/contact_event.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/bloc/contact_state.dart';
import 'package:fluttersocket/features.auth/contacts/usecases/add_contact_usecase.dart';
import 'package:fluttersocket/features.auth/contacts/usecases/fetch_contacts_usecase.dart';

class ContactBloc extends Bloc<ContactsEvent,ContactState>{

  final FetchContactUseCase fetchContactUseCase;
  final AddContactUseCase addContactUseCase;

  ContactBloc({required this.fetchContactUseCase, required this.addContactUseCase}):
  super(ContactIntailize()){
  on<FetchContacts>(_onFetchContacts);
  on<AddContacts>(_onAddContacts);

  }

  Future<void> _onFetchContacts(FetchContacts event,Emitter<ContactState> emit) async
  {
    emit(ContactsLoading());
    try
        {
          final contacts = await fetchContactUseCase();

          emit(ContactLoaded(contactlistResponseModel: contacts));
        }
        catch(e){
          emit(ContactError(message: 'Failed to fetch contacts'));
        }

  }

  Future<void> _onAddContacts(AddContacts event,Emitter<ContactState> emit) async
  {
    emit(ContactsLoading());
    try
    {
    await addContactUseCase(email: event.email);

      emit(ContactAdded());
      add(FetchContacts());
    }
    catch(e){
      emit(ContactError(message: 'Failed to fetch contacts'));
    }

  }

}