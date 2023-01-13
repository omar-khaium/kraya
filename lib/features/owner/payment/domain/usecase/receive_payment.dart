import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/payment.dart';

class ReceivePaymentUsecase extends Usecase<bool, ReceivePaymentParam> {
  final OwnerPaymentRepository repository;

  ReceivePaymentUsecase(this.repository);
  @override
  Future<Either<Failure, bool>> call(param) {
    return repository.receivePayment(
      ownerId: 1,
      tenantId: 1,
      propertyId: 1,
      month: DateTime(2023, 1),
      amount: param.amount,
    );
  }
}

class ReceivePaymentParam {
  final int ownerId;
  final int tenantId;
  final int propertyId;
  final DateTime month;
  final int amount;

  ReceivePaymentParam({
    required this.ownerId,
    required this.tenantId,
    required this.propertyId,
    required this.month,
    required this.amount,
  });
}
