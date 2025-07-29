import 'package:fluttersocket/features.auth/contacts/responsemodel/ContactlistResponseModel.dart';

abstract class ContactState{}

class ContactIntailize extends ContactState{}

class ContactsLoading extends ContactState{}

class ContactLoaded extends ContactState{

  final ContactlistResponseModel contactlistResponseModel;

  ContactLoaded({required this.contactlistResponseModel});



}

class ContactError extends ContactState{


  final String message;
  ContactError({required this.message});
}

class ContactAdded extends ContactState{}