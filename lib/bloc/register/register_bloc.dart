import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../authentication/authentication.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterBtnEvent>((event, emit) async {
      emit.call(RegisterLoadingState());
      try {
        User? user = await registerWithEmailAndPassword(
            event.email, event.password, event.name);
        emit(RegisterLoadedState(user));
      } on FirebaseAuthException catch (e) {
        emit.call(RegisterErrorState(e.code));
      } catch (e) {
        emit.call(RegisterErrorState(e.toString()));
      }
    });
  }
}
