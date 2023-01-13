import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entity/payment.dart';
import '../repository/payment.dart';

class PaymentOverviewUsecase extends Usecase<List<PaymentEntity>, NoParam> {
  final OwnerPaymentRepository _repository;

  PaymentOverviewUsecase(this._repository);

  @override
  Future<Either<Failure, List<PaymentEntity>>> call(NoParam param) async {
    return _repository.overview();
  }
}
