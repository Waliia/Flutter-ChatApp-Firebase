import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../authentication/authentication.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginClickEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        User? user =
            await loginWithEmailAndPassword(event.email, event.passwrod);
        emit(LoginLoadedState(user));
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "ERROR_INVALID_EMAIL":
            var errorMessage = "Your email address appears to be malformed.";
            emit.call(LoginErrorState(errorMessage));
            break;
          case "ERROR_WRONG_PASSWORD":
            var errorMessage = "Your password is wrong.";
            emit.call(LoginErrorState(errorMessage));
            break;
          case "ERROR_USER_NOT_FOUND":
            var errorMessage = "User with this email doesn't exist.";
            emit.call(LoginErrorState(errorMessage));
            break;
          case "ERROR_USER_DISABLED":
            var errorMessage = "User with this email has been disabled.";
            emit.call(LoginErrorState(errorMessage));
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            var errorMessage = "Too many requests. Try again later.";
            emit.call(LoginErrorState(errorMessage));
            break;
          case "user-not-found":
            var errorMessage = "there is no user with this email";
            emit.call(LoginErrorState(errorMessage));
            break;
          default:
            var errorMessage = "An undefined Error happened.";
            emit.call(LoginErrorState(errorMessage));
        }
      } catch (e) {
        emit.call(LoginErrorState('simple'));
      }
    });
  }
}
