import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../entity/full_profile.dart';
import '../repository/profile.dart';

class TenantFullProfileUsecase implements Usecase<TenantFullProfileEntity, int> {
  final TenantProfileRepository _repository;

  TenantFullProfileUsecase(this._repository);

  @override
  Future<Either<Failure, TenantFullProfileEntity>> call(int id) async {
    return await _repository.fullProfile(tenantId: id);
  }
}
