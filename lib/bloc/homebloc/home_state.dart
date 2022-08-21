// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<UserModel> users;
  HomeLoadedState(
    this.users,
  );
}

class HomeErrorState extends HomeState {
  String message;
  HomeErrorState(this.message);
}

class EmptyState extends HomeState {}
