import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<OwnerBankAccountRemoteDataSource>()])
abstract class OwnerBankAccountRemoteDataSource {
  Future<bool> submit({
    required int ownerId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  });
}
