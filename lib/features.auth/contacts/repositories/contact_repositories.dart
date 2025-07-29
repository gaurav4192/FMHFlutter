import 'package:fluttersocket/features.auth/contacts/responsemodel/ContactlistResponseModel.dart';

abstract class ContactRepository{

  Future <ContactlistResponseModel> fetchContacts();
  Future <void> addContact({required String email});

}

