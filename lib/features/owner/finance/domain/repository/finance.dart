import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<OwnerFinanceRepository>()])
abstract class OwnerFinanceRepository {
  Future<Either<Failure, int>> overview({required int ownerId, required DateTime from, required DateTime to});
}
