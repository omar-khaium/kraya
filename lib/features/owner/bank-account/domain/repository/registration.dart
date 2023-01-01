import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<OwnerBankAccountRepository>()])
abstract class OwnerBankAccountRepository {
  Future<Either<Failure, bool>> submit({
    required int ownerId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  });
}
