import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Connection {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements Connection {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected async => await connectionChecker.hasConnection;
}
