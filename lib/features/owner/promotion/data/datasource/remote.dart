import 'package:mockito/annotations.dart';

import '../model/banner.dart';

@GenerateNiceMocks([MockSpec<OwnerBannerPromotionRemoteDataSource>()])
abstract class OwnerBannerPromotionRemoteDataSource {
  Future<List<BannerModel>> getAll();
}
