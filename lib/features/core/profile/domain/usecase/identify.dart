import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../entity/profile.dart';
import '../repository/profile.dart';

class IdentifyUsecase implements Usecase<ProfileEntity, String> {
  final ProfileRepository _repository;

  IdentifyUsecase(this._repository);

  @override
  Future<Either<Failure, ProfileEntity>> call(String phone) async {
    return await _repository.identify(phone: phone);
  }
}
