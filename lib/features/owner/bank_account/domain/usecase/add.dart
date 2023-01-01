import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';

import '../repository/bank_account.dart';

class AddOwnerBankAccountUsecase extends Usecase<bool, AddOwnerBankAccountParams> {
  final OwnerBankAccountRepository _repository;

  AddOwnerBankAccountUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.add(
      ownerId: param.ownerId,
      bankId: param.bankId,
      name: param.name,
      accountNumber: param.accountNumber,
      branch: param.branch,
    );
  }
}

class AddOwnerBankAccountParams {
  final int ownerId;
  final int bankId;
  final String name;
  final String accountNumber;
  final String branch;

  AddOwnerBankAccountParams({
    required this.ownerId,
    required this.bankId,
    required this.name,
    required this.accountNumber,
    required this.branch,
  });
}
