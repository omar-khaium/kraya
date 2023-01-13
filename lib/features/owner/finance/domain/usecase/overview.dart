import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/finance.dart';

class OwnerFinanceOverviewUsecase extends Usecase<int, OwnerFinanceOverviewParam> {
  final OwnerFinanceRepository _repository;

  OwnerFinanceOverviewUsecase(this._repository);

  @override
  Future<Either<Failure, int>> call(OwnerFinanceOverviewParam param) async {
    return _repository.overview(
      ownerId: param.ownerId,
      from: param.from,
      to: param.to,
    );
  }
}

class OwnerFinanceOverviewParam extends Equatable {
  final int ownerId;
  final DateTime from;
  final DateTime to;

  OwnerFinanceOverviewParam({required this.ownerId, required this.from, required this.to});

  @override
  List<Object?> get props => [ownerId, from, to];
}
