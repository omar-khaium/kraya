import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';

import '../repository/bill.dart';

class AddOwnerBillUsecase extends Usecase<bool, AddOwnerBillParams> {
  final OwnerBillRepository _repository;

  AddOwnerBillUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.add(
      ownerId: param.ownerId,
      propertyId: param.propertyId,
      name: param.name,
      amount: param.amount,
      extra: param.extra,
    );
  }
}

class AddOwnerBillParams {
  final int ownerId;
  final int propertyId;
  final String name;
  final int amount;
  final int extra;

  AddOwnerBillParams({
    required this.ownerId,
    required this.propertyId,
    required this.name,
    required this.amount,
    required this.extra,
  });
}
