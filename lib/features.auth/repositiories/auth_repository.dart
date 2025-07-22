import 'package:fluttersocket/features.auth/entities/login_respose_model.dart';
import 'package:fluttersocket/features.auth/entities/user_entity.dart';

abstract class AuthRepository{
  Future<LoginResposeModel> login(String email,String Password);

}