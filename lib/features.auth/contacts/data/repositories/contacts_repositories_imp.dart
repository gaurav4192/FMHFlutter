import 'package:fluttersocket/features.auth/contacts/data/datasources/contact_remotedatasource.dart';
import 'package:fluttersocket/features.auth/contacts/repositories/contact_repositories.dart';
import 'package:fluttersocket/features.auth/contacts/responsemodel/ContactlistResponseModel.dart';
import 'package:fluttersocket/features.auth/conversation/data/datasources/conversations_remote_data_source.dart';

class ContactRepostoriesImpl implements ContactRepository{

  final ContactRemoteDataSource remoteDataSource;

  ContactRepostoriesImpl({required this.remoteDataSource});

  @override
  Future<void> addContact({required String email}) async {
    // TODO: implement addContact
    return await remoteDataSource.addContacts(email: email);
  }

  Future<ContactlistResponseModel> fetchContacts() async{
    return await remoteDataSource.fetchContacts();
  }
}