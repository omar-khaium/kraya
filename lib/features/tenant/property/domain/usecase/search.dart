import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/property.dart';

class TenantSearchPropertyUsecase extends Usecase<List<int>, TenantSearchPropertyParams> {
  final TenantPropertyRepository _repository;

  TenantSearchPropertyUsecase(this._repository);

  @override
  Future<Either<Failure, List<int>>> call(param) async {
    return await _repository.search(
      keyword: param.keyword,
      typeId: param.typeId,
      subTypeId: param.subTypeId,
    );
  }
}

class TenantSearchPropertyParams {
  final String keyword;
  final int typeId;
  final int subTypeId;

  TenantSearchPropertyParams({
    required this.keyword,
    required this.typeId,
    required this.subTypeId,
  });
}
