import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TenantFinanceRemoteDataSource>()])
abstract class TenantFinanceRemoteDataSource {
  Future<int> overview({required int tenantId, required DateTime from, required DateTime to});
}
