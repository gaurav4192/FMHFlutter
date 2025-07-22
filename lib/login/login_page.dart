import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:fluttersocket/features.auth/presentation/bloc/auth_event.dart';
import 'package:fluttersocket/features.auth/presentation/bloc/auth_state.dart';

import '../constants/strings.dart';
import '../resources/AppColors.dart';
import '../features.auth/presentation/widgets/custom_buttons.dart';
import '../features.auth/presentation/widgets/input_fields.dart';

class LoginPage extends StatefulWidget{


  @override
  State<LoginPage> createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool passwordVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();

}
  void _login(){
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(username: _usernameController.text.trim().toString(), password: _passwordController.text.trim().toString())
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      backgroundColor: AppColors.lightOrangeColor,
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomTextField(
          inputController: _usernameController, hintText: "  Username", errorText: 'Please Enter your Username',
                    ),
                SizedBox(height: 10,),
              PasswordInputField(
                textEditingController: _passwordController,
              ),
              SizedBox(height: 10,),

              // CustomPrimaryButton(
              //
              //   buttonColor:Colors.yellow,
              //   textValue: Strings.loginLabel,
              //   textColor: Colors.black,
              //   onClick: _login,
              // ),

              BlocConsumer<AuthBloc,AuthState>(
                builder: (context,state){
                  if(state is AuthLoading)
                    {
                      return Center(child: CircularProgressIndicator());
                    }

                  return CustomPrimaryButton(

                    buttonColor:Colors.yellow,
                    textValue: Strings.loginLabel,
                    textColor: Colors.black,
                    onClick: _login,
                  );
                },
                listener: (context,state){

                  if(state is AuthSuccess){
                    print('Respose====>${state.message.toString()}');
                    if(state.message=="User logged in!")
                      {
                        Navigator.pushNamed(context, '/conversationsPage');
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                   // Navigator.pushNamed(context, '/dashboard');
                  }
                  else if(state is AuthFailure){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },

              )

            ],
          ),


        ),
      ),
    );
  }


}