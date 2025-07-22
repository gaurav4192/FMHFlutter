
import 'package:fluttersocket/features.auth/entities/login_respose_model.dart';
import 'package:fluttersocket/features.auth/entities/user_entity.dart';
import 'package:fluttersocket/features.auth/repositiories/auth_repository.dart';

class LoginUseCase{
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<LoginResposeModel> call(String email,String Password){
    return authRepository.login(email, Password);
  }
}