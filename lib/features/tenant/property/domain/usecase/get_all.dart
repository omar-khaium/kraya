import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/property.dart';

class TenantGetAllPropertiesUsecase extends Usecase<List<int>, TenantGetAllPropertiesParams> {
  final TenantPropertyRepository _repository;

  TenantGetAllPropertiesUsecase(this._repository);

  @override
  Future<Either<Failure, List<int>>> call(param) async {
    return await _repository.getAll(
      tenantId: param.tenantId,
    );
  }
}

class TenantGetAllPropertiesParams {
  final int tenantId;

  TenantGetAllPropertiesParams({
    required this.tenantId,
  });
}
