import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/payment.dart';

class PaymentNotifyUsecase extends Usecase<bool, PaymentNotifyParam> {
  final OwnerPaymentRepository repository;

  PaymentNotifyUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(PaymentNotifyParam param) {
    return repository.notify(
      tenantId: param.tenantId,
      propertyId: param.propertyId,
      month: param.month,
    );
  }
}

class PaymentNotifyParam {
  final int tenantId;
  final int propertyId;
  final DateTime month;

  PaymentNotifyParam({required this.tenantId, required this.propertyId, required this.month});
}
