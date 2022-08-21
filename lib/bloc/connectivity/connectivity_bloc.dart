import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _subscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    checkConnectivity();
    listenConnectivity();

    on<DisConnectedEvent>((event, emit) {
      emit.call(DisconnectedState(event.result));
    });
    on<ConnectedEvent>((event, emit) {
      emit.call(ConnectedState(event.result));
    });
  }

  bool isConnected(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet;
  }

  void checkConnectivity() {
    _connectivity.checkConnectivity().then((result) {
      if (isConnected(result)) {
        add(ConnectedEvent(result));
      } else {
        add(DisConnectedEvent(result));
      }
    });
  }

  void listenConnectivity() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (isConnected(result)) {
        add(ConnectedEvent(result));
      } else {
        add(DisConnectedEvent(result));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
