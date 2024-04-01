import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movies_app/data/clients/connectivity_client.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final ConnectivityClient _connectivityClient;
  late final StreamSubscription _connectivityStream;

  ConnectivityCubit({
    required ConnectivityClient connectivityClient,
  })  : _connectivityClient = connectivityClient,
        super(ConnectivityState()) {
    _connectivityStream = _connectivityClient.connectivity.onConnectivityChanged
        .listen(_onConnectivityStateChanged);
  }

  Future<void> _onConnectivityStateChanged(
      List<ConnectivityResult> resList) async {
    if (resList.contains(ConnectivityResult.mobile) ||
        resList.contains(ConnectivityResult.wifi)) {
      emit(ConnectivityState(type: ConnectivityStateType.connected));
    } else if (resList.contains(ConnectivityResult.none)) {
      emit(ConnectivityState(type: ConnectivityStateType.offline));
    } else {
      emit(ConnectivityState(type: ConnectivityStateType.unknown));
    }
  }

  @override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }
}
