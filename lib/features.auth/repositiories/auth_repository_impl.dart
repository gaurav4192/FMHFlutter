
import 'package:fluttersocket/features.auth/data/datasource/authRemoteSource.dart';
import 'package:fluttersocket/features.auth/entities/login_respose_model.dart';
import 'package:fluttersocket/features.auth/repositiories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository
{
  final AuthRemoteSource authRemoteSource;

  AuthRepositoryImp({required this.authRemoteSource});


  @override
  Future <LoginResposeModel> login(String username,String password) async
  {
    return authRemoteSource.login(username: username, password: password);
  }
}