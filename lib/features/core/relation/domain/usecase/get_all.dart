import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entity/relation.dart';
import '../repository/relation.dart';

class GetAllRelationsUsecase extends Usecase<List<RelationEntity>, NoParam> {
  final RelationRepository _repository;

  GetAllRelationsUsecase(this._repository);

  @override
  Future<Either<Failure, List<RelationEntity>>> call(NoParam param) async {
    return _repository.getAllRelations();
  }
}
