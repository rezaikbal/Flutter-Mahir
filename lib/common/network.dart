import 'package:data_connection_checker/data_connection_checker.dart';

abstract class Network {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends Network {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
