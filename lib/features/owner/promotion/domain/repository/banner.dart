import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entity/banner.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<OwnerBannerPromotionRepository>()])
abstract class OwnerBannerPromotionRepository {
  Future<Either<Failure, List<BannerEntity>>> getAll();
}
