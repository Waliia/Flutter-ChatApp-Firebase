part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterBtnEvent extends RegisterEvent {
  final String email;
  final String password;
  final String name;

  RegisterBtnEvent(this.name, this.password, this.email);
}
