import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';
import '../entity/feature.dart';

@GenerateNiceMocks([MockSpec<FeatureRepository>()])
abstract class FeatureRepository {
  Future<Either<Failure, List<FeatureEntity>>> getAllFeatures();
}
