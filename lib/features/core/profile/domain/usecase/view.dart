import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../entity/profile.dart';
import '../repository/profile.dart';

class ViewUsecase implements Usecase<ProfileEntity, int> {
  final ProfileRepository _repository;

  ViewUsecase(this._repository);

  @override
  Future<Either<Failure, ProfileEntity>> call(int id) async {
    return await _repository.view(id: id);
  }
}
