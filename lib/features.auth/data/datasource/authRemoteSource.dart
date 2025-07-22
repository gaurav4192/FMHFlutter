import 'dart:convert';

import 'package:fluttersocket/features.auth/entities/login_respose_model.dart';
import 'package:http/http.dart'as http;

class AuthRemoteSource{
  final String baseUrl='http://192.168.29.231:3000/auth';


  Future<LoginResposeModel> login({required String username, required String password}) async{

    final response= await http.post(
        Uri.parse('$baseUrl/login'),
      body: jsonEncode({'username':username,'password':password}),
      headers: {'Content-Type':'application/json'}
    );



    return LoginResposeModel.fromJson(jsonDecode(response.body));
  }

}