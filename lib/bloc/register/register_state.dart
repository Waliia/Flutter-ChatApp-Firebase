part of 'register_bloc.dart';

@immutable
abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  final User? user;
  const RegisterLoadedState(this.user);
}

class RegisterErrorState extends RegisterState {
  final String message;
  const RegisterErrorState(this.message);
}
