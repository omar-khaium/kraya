import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
abstract class NetworkInfo implements InternetConnectionChecker {
  Future<bool> get online;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker, required this.addresses});

  @override
  List<AddressCheckOptions> addresses;

  @override
  Duration get checkInterval => Duration(seconds: 10);

  @override
  Duration get checkTimeout => Duration(seconds: 5);

  @override
  Future<InternetConnectionStatus> get connectionStatus => internetConnectionChecker.connectionStatus;

  @override
  Future<bool> get hasConnection => internetConnectionChecker.hasConnection;

  @override
  bool get hasListeners => internetConnectionChecker.hasListeners;

  @override
  bool get isActivelyChecking => internetConnectionChecker.isActivelyChecking;

  @override
  Future<bool> get online => internetConnectionChecker.hasConnection;

  @override
  Future<AddressCheckResult> isHostReachable(AddressCheckOptions options) => internetConnectionChecker.isHostReachable(options);

  @override
  Stream<InternetConnectionStatus> get onStatusChange => internetConnectionChecker.onStatusChange;
}
