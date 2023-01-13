import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';

import '../repository/property.dart';

class OwnerSendBillUsecase extends Usecase<bool, OwnerSendBillParams> {
  final OwnerPropertyRepository _repository;

  OwnerSendBillUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.sendBill(
      tenantId: param.tenantId,
      propertyId: param.propertyId,
    );
  }
}

class OwnerSendBillParams {
  final int tenantId;
  final int propertyId;

  OwnerSendBillParams({
    required this.tenantId,
    required this.propertyId,
  });
}
