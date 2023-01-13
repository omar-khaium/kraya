import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/finance.dart';

class FinanceOverviewUsecase extends Usecase<int, NoParam> {
  final FinanceRepository _repository;

  FinanceOverviewUsecase(this._repository);

  @override
  Future<Either<Failure, int>> call(NoParam param) async {
    return _repository.overview();
  }
}
