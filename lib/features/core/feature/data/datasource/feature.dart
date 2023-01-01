import 'package:mockito/annotations.dart';
import '../model/feature.dart';

@GenerateNiceMocks([MockSpec<FeatureRemoteDataSource>()])
abstract class FeatureRemoteDataSource {
  Future<List<FeatureModel>> getAllFeatures();
}
