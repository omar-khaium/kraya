import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<TenantBankAccountRepository>()])
abstract class TenantBankAccountRepository {
  Future<Either<Failure, bool>> add({
    required int tenantId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  });
}
