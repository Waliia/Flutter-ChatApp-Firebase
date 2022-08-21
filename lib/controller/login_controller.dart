import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/authentication/authentication.dart';
import 'package:flutter_firebase_demo/screens/register/register_screen.dart';
import 'package:provider/provider.dart';

import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';

String? isValidEmail(String? email) {
  /*
     This fucntion validate email
   */
  if (email!.isEmpty) {
    return 'must enter email';
  } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return null;
  } else {
    return 'email is not valid';
  }
}

String? isValidPassword(String? password) {
  /*
     This fucntion validate password
   */
  if (password!.isEmpty) {
    return 'must enter passowrd';
  } else if (password.length < 7) {
    return 'length should>=7';
  } else {
    return null;
  }
}

String? isValidName(String? name) {
  if (name!.isEmpty) {
    return 'must enter name';
  } else {
    return null;
  }
}

void forgotPasswordClick(String email) {
  forgotPassword(email);
}

void btnLogin(
    {context,
    emailController,
    emailValidationKey,
    passwordController,
    passwordValidationKey}) {
  LoginBloc loginBloc = Provider.of<LoginBloc>(context, listen: false);
  if ((emailValidationKey as GlobalKey<FormFieldState>)
          .currentState!
          .validate() &&
      (passwordValidationKey as GlobalKey<FormFieldState>)
          .currentState!
          .validate()) {
    loginBloc.add(LoginClickEvent(
        emailController.text.trim(),
        passwordController.text
            .trim())); //removes whitespace from both ends of a string.
  }
}

void registerNowClick(BuildContext context) {
  Navigator.pushReplacementNamed(context, RegisterScreen.PAGE_NAME);
}
