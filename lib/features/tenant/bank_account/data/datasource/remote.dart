import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TenantBankAccountRemoteDataSource>()])
abstract class TenantBankAccountRemoteDataSource {
  Future<bool> add({
    required int tenantId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  });
}
