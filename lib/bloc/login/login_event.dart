import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}

class LoginClickEvent extends LoginEvent {
  String email;
  String passwrod;
  LoginClickEvent(this.email, this.passwrod);
}
