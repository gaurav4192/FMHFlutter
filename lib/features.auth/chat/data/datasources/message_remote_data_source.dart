import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/MessageResponseModel.dart';
import 'package:fluttersocket/features.auth/chat/domain/entity/message_entity.dart';
import 'package:fluttersocket/features.auth/conversation/data/models/ConversationModel.dart';
import 'package:fluttersocket/features.auth/conversation/domain/entities/conversation_response_model.dart';
import 'package:http/http.dart'as http;

class MessageRemoteDataSource{
  final String base_url='http://192.168.29.231:3000';
  final _storage =FlutterSecureStorage();


  Future<MessageResponseModel> fetchMessages(String conversationId) async{
    String? token=await _storage.read(key: 'token');

    final response=await http.get(
        Uri.parse('$base_url/messages/$conversationId'),
        headers: {
          'Authorization':'Bearer $token'
        }
        
    );
    if(response.statusCode==200)
    {
      return MessageResponseModel.fromJson(jsonDecode(response.body));
    }
    else
    {
      return MessageResponseModel.fromJson('Failed to load conversations: ${response.statusCode}');
    }
  }
}