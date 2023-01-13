import 'package:kraya_backend/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/core/usecase/usecase.dart';
import 'package:kraya_backend/features/owner/promotion/domain/entity/banner.dart';
import 'package:kraya_backend/features/owner/promotion/domain/repository/banner.dart';

class GetAllOwnerBannerUsecase extends Usecase<List<BannerEntity>, NoParam> {
  final OwnerBannerPromotionRepository repository;

  GetAllOwnerBannerUsecase(this.repository);
  @override
  Future<Either<Failure, List<BannerEntity>>> call(param) async {
    return await repository.getAll();
  }
}
