import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/property.dart';

class TenantAddPropertyUsecase extends Usecase<bool, TenantAddPropertyParams> {
  final TenantPropertyRepository _repository;

  TenantAddPropertyUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.add(
      tenantId: param.tenantId,
      propertyId: param.propertyId,
    );
  }
}

class TenantAddPropertyParams {
  final int tenantId;
  final int propertyId;

  TenantAddPropertyParams({
    required this.tenantId,
    required this.propertyId,
  });
}
