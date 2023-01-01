import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../../core/error/failures.dart';
import '../entity/profile.dart';

@GenerateNiceMocks([MockSpec<ProfileRepository>()])
abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> identify({required String phone});
  Future<Either<Failure, ProfileEntity>> view({required int id});
}
