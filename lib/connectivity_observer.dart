abstract class ConnectivityObserver {
  Stream<Status> observe();
}

enum Status {
  available,
  unavailable,
}