import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/bank_account.dart';

class AddTenantBankAccountUsecase extends Usecase<bool, AddTenantBankAccountParams> {
  final TenantBankAccountRepository _repository;

  AddTenantBankAccountUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.add(
      tenantId: param.tenantId,
      bankId: param.bankId,
      name: param.name,
      accountNumber: param.accountNumber,
      branch: param.branch,
    );
  }
}

class AddTenantBankAccountParams {
  final int tenantId;
  final int bankId;
  final String name;
  final String accountNumber;
  final String branch;

  AddTenantBankAccountParams({
    required this.tenantId,
    required this.bankId,
    required this.name,
    required this.accountNumber,
    required this.branch,
  });
}
