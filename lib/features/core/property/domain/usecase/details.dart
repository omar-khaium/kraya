import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../entity/details.dart';
import '../repository/property.dart';

class PropertyDetailsUsecase implements Usecase<PropertyDetailsEntity, int> {
  final PropertyRepository _repository;

  PropertyDetailsUsecase(this._repository);

  @override
  Future<Either<Failure, PropertyDetailsEntity>> call(int id) async {
    return await _repository.details(id: id);
  }
}
