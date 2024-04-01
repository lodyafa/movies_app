import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityClient {
  late final Connectivity _connectivity;

  ConnectivityClient({required Connectivity connectivity})
      : _connectivity = connectivity;
  
  Connectivity get connectivity => _connectivity;

  // Future<bool> isConnected() async {
  //   ConnectivityResult res = await _connectivity.checkConnectivity();
  //   if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) return true;
  //   return false;
  // }

  // Future<ConnectivityResult> checkConnectivity() async {
  //   return await _connectivity.checkConnectivity();
  // }
}