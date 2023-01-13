import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<FinanceRepository>()])
abstract class FinanceRepository {
  Future<Either<Failure, int>> overview();
}
