import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<TenantPropertyRepository>()])
abstract class TenantPropertyRepository {
  Future<Either<Failure, bool>> add({
    required int tenantId,
    required int propertyId,
  });

  Future<Either<Failure, List<int>>> search({
    required String keyword,
    required int typeId,
    required int subTypeId,
  });

  Future<Either<Failure, List<int>>> getAll({
    required int tenantId,
  });
}
