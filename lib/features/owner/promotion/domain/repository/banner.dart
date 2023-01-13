import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/features/owner/promotion/domain/entity/banner.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<OwnerBannerPromotionRepository>()])
abstract class OwnerBannerPromotionRepository {
  Future<Either<Failure, List<BannerEntity>>> getAll();
}
