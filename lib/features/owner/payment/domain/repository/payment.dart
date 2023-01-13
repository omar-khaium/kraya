import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';
import '../entity/payment.dart';

@GenerateNiceMocks([MockSpec<OwnerPaymentRepository>()])
abstract class OwnerPaymentRepository {
  Future<Either<Failure, List<PaymentEntity>>> overview();

  Future<Either<Failure, bool>> notify({
    required int tenantId,
    required int propertyId,
    required DateTime month,
  });

  Future<Either<Failure, bool>> receivePayment({
    required int ownerId,
    required int tenantId,
    required int propertyId,
    required DateTime month,
    required int amount,
  });
}
