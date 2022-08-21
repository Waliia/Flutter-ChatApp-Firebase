import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  User? user;
  LoginLoadedState(this.user);
}

class LoginErrorState extends LoginState {
  String errorMsg;
  LoginErrorState(this.errorMsg);
}
