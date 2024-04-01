part of 'connectivity_cubit.dart';

enum ConnectivityStateType {
  connected,
  offline,
  unknown,
}

class ConnectivityState {
  final ConnectivityStateType type;

  ConnectivityState({
    this.type = ConnectivityStateType.unknown,
  });
}
