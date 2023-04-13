import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


part 'app_state.dart';

// enum ConnectivityStatus { connected, disconnected }
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInternetConnectionNone()){
    _subscription = _connectivity.onConnectivityChanged.listen(_onConnectivityChange);
  }


  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;


  void _onConnectivityChange(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      emit(AppInternetConnectionNone());
    } else {
      emit(AppInternetConnectionConnected());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

}
