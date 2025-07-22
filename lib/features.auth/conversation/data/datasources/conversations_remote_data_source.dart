import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersocket/features.auth/conversation/data/models/ConversationModel.dart';
import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';
import 'package:http/http.dart'as http;

class ConversationsRemoteDataSource{
  final String base_url='http://192.168.29.231:3000';
  final _storage =FlutterSecureStorage();


  Future<ConversationResponseModel> fetchConversation() async{

    String? token=await _storage.read(key: 'token');

    final response=await http.get(
      Uri.parse('$base_url/conversations'),
      headers: {
        'Authorization':'Bearer $token'
      }

    );
    if(response.statusCode==200)
      {

        return ConversationResponseModel.fromJson(jsonDecode(response.body));
      }
    else
      {
        return ConversationResponseModel.fromJson('Failed to load conversations: ${response.statusCode}');
      }
}
}