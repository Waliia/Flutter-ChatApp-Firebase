import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_demo/authentication/firebase.dart';
import 'package:flutter_firebase_demo/model/user_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<FetchUserEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        List<UserModel> user = await fetchUser();
        if (user.isEmpty) {
          emit(EmptyState());
        } else {
          emit(HomeLoadedState(user));
        }
      } on FirebaseException catch (e) {
        emit(HomeErrorState(e.message!));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
