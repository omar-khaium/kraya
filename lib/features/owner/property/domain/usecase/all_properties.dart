import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/property.dart';

class OwnerAllPropertiesUsecase extends Usecase<List<int>, int> {
  final OwnerPropertyRepository _repository;

  OwnerAllPropertiesUsecase(this._repository);

  @override
  Future<Either<Failure, List<int>>> call(int param) async {
    return await _repository.allProperties(ownerId: param);
  }
}