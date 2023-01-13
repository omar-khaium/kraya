import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';
import '../entity/banner.dart';

@GenerateNiceMocks([MockSpec<OwnerBannerPromotionRepository>()])
abstract class OwnerBannerPromotionRepository {
  Future<Either<Failure, List<BannerEntity>>> getAll();
}
