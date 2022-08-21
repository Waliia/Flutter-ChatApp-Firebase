import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

import '../bloc/register/register_bloc.dart';

void btnRegisterClick(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
    required TextEditingController passwordController,
    required GlobalKey<FormFieldState> passwordValidationKey}) {
  if (emailValidationKey.currentState!.validate() &&
      passwordValidationKey.currentState!.validate() &&
      nameValidationKey.currentState!.validate()) {
    RegisterBloc bloc = Provider.of<RegisterBloc>(context, listen: false);
    bloc.add(RegisterBtnEvent(nameController.text.trim(),
        passwordController.text.trim(), emailController.text.trim()));
  }
}

void loginClick(BuildContext context) {
  Navigator.pushNamed(context, LoginScreen.PAGE_NAME);
}
