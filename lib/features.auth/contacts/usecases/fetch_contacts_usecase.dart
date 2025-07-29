
import 'package:fluttersocket/features.auth/contacts/repositories/contact_repositories.dart';
import 'package:fluttersocket/features.auth/contacts/responsemodel/ContactlistResponseModel.dart';

class FetchContactUseCase{
  final ContactRepository contactRepository;

  FetchContactUseCase({required this.contactRepository});

  Future<ContactlistResponseModel> call() async{
    return await contactRepository.fetchContacts();
}

}