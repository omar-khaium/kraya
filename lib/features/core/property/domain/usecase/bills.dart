import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../entity/bills.dart';
import '../repository/property.dart';

class PropertyBillsUsecase implements Usecase<PropertyBillsEntity, int> {
  final PropertyRepository _repository;

  PropertyBillsUsecase(this._repository);

  @override
  Future<Either<Failure, PropertyBillsEntity>> call(int id) async {
    return await _repository.bills(id: id);
  }
}
