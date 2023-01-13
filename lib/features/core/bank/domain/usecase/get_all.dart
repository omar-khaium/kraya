import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entity/bank.dart';
import '../repository/bank.dart';

class GetAllBanksUsecase extends Usecase<List<BankEntity>, NoParam> {
  final BankRepository _repository;

  GetAllBanksUsecase(this._repository);

  @override
  Future<Either<Failure, List<BankEntity>>> call(NoParam param) async {
    return _repository.getAllBanks();
  }
}
