import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<OwnerBillRepository>()])
abstract class OwnerBillRepository {
  Future<Either<Failure, bool>> add({
    required int ownerId,
    required int propertyId,
    required String name,
    required int amount,
    required int extra,
  });
}
