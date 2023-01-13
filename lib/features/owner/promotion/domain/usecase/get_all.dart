import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entity/banner.dart';
import '../repository/banner.dart';

class GetAllOwnerBannerUsecase extends Usecase<List<BannerEntity>, NoParam> {
  final OwnerBannerPromotionRepository repository;

  GetAllOwnerBannerUsecase(this.repository);
  @override
  Future<Either<Failure, List<BannerEntity>>> call(param) async {
    return await repository.getAll();
  }
}
