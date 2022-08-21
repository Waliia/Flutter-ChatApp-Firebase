part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectedState extends ConnectivityState {
  ConnectivityResult result;
  ConnectedState(this.result);
}

class DisconnectedState extends ConnectivityState {
  ConnectivityResult result;
  DisconnectedState(this.result);
}
