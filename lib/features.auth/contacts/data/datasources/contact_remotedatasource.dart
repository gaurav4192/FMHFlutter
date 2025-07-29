import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersocket/features.auth/contacts/responsemodel/ContactlistResponseModel.dart';
import 'package:fluttersocket/features.auth/conversation/data/models/ConversationModel.dart';
import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';
import 'package:http/http.dart'as http;

class ContactRemoteDataSource{
  final String base_url='http://192.168.29.231:3000';
  final _storage =FlutterSecureStorage();


  Future<ContactlistResponseModel> fetchContacts() async{

    String? token=await _storage.read(key: 'token');

    final response=await http.get(
        Uri.parse('$base_url/contacts'),
        headers: {
          'Authorization':'Bearer $token'
        }

    );
    if(response.statusCode==200)
    {

      return ContactlistResponseModel.fromJson(jsonDecode(response.body));
    }
    else
    {
      return ContactlistResponseModel.fromJson('Failed to load contact: ${response.statusCode}');
    }
  }
  Future<void> addContacts({required String email}) async{
    String? token=await _storage.read(key: 'token');
    final response= await http.post(
        Uri.parse('$base_url/contacts'),
        body: jsonEncode({'contactEmail':email}),
        headers: {
          'Content-Type':'application/json',
          'Authorization':'Bearer $token'

        });

    if(response.statusCode!=201)
      {
        throw Exception('Failed to addContact');
      }



  }

}