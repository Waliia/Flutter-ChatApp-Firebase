part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}

class ConnectedEvent extends ConnectivityEvent {
  ConnectivityResult result;
  ConnectedEvent(this.result);
}

class DisConnectedEvent extends ConnectivityEvent {
  ConnectivityResult result;
  DisConnectedEvent(this.result);
}
