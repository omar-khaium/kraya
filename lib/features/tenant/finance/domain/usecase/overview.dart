import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/finance.dart';

class TenantFinanceOverviewUsecase extends Usecase<int, TenantFinanceOverviewParam> {
  final TenantFinanceRepository _repository;

  TenantFinanceOverviewUsecase(this._repository);

  @override
  Future<Either<Failure, int>> call(TenantFinanceOverviewParam param) async {
    return _repository.overview(tenantId: param.tenantId, from: param.from, to: param.to);
  }
}

class TenantFinanceOverviewParam extends Equatable {
  final int tenantId;
  final DateTime from;
  final DateTime to;

  TenantFinanceOverviewParam({required this.tenantId, required this.from, required this.to});

  @override
  List<Object?> get props => [tenantId, from, to];
}
