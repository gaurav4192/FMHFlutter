import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersocket/features.auth/presentation/bloc/auth_event.dart';
import 'package:fluttersocket/features.auth/presentation/bloc/auth_state.dart';
import 'package:fluttersocket/features.auth/usecase/login_use_case.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>
{

  final LoginUseCase loginUseCase;
  final _storage=FlutterSecureStorage();
  AuthBloc({required this.loginUseCase}):super(AuthIntial()){

    on<LoginEvent>(_onlogin);

  }


  Future <void> _onlogin(LoginEvent event,Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try{
      final user=await loginUseCase.call(event.username, event.password);


      await _storage.write(key:"token", value: user.token);
      await _storage.write(key:"userId", value: user.data?.id.toString()??'');
      print('token===>${user.token.toString()}');
      emit(AuthSuccess(message:user.message.toString()));
    }
    catch(e)
    {
      print('error==>${e.toString()}');
      emit(AuthFailure(error: 'Login Failure !'));
    }


  }
}