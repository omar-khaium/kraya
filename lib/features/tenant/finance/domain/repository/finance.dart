import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<TenantFinanceRepository>()])
abstract class TenantFinanceRepository {
  Future<Either<Failure, int>> overview({required int tenantId, required DateTime from, required DateTime to});
}
