import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connectivity/connectivity_observer.dart';

class NetworkConnectivityObserver implements ConnectivityObserver {
  final _connectivity = Connectivity();

  @override
  Stream<Status> observe() {
    return _connectivity.onConnectivityChanged.where((event) {
      return event == ConnectivityResult.wifi ||
          event == ConnectivityResult.ethernet ||
          event == ConnectivityResult.mobile ||
          event == ConnectivityResult.none;
    }).map((event) {
      switch (event) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
          return Status.available;
        default:
          return Status.unavailable;
      }
    });
  }
}
