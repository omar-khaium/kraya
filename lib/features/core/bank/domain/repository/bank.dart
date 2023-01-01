import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';

import '../entity/bank.dart';

@GenerateNiceMocks([MockSpec<BankRepository>()])
abstract class BankRepository {
  Future<Either<Failure, List<BankEntity>>> getAllBanks();
}
