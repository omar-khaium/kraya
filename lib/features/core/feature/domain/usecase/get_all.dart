import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entity/feature.dart';
import '../repository/feature.dart';

class GetAllFeaturesUsecase extends Usecase<List<FeatureEntity>, NoParam> {
  final FeatureRepository _repository;

  GetAllFeaturesUsecase(this._repository);

  @override
  Future<Either<Failure, List<FeatureEntity>>> call(NoParam param) async {
    return _repository.getAllFeatures();
  }
}
