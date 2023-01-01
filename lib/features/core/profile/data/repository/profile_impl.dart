import 'package:dartz/dartz.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../core/network/network_info.dart';
import '../../domain/entity/profile.dart';
import '../../domain/repository/profile.dart';
import '../datasource/local.dart';
import '../datasource/remote.dart';
import '../model/profile.dart';

typedef _IdentifyOrViewChooser = Future<ProfileModel> Function();

class ProfileRepositoryImpl extends ProfileRepository {
  late ProfileRemoteDataSource remoteDataSource;
  late ProfileLocalDataSource localDataSource;
  late NetworkInfo networkInfo;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProfileEntity>> identify({required String phone}) async {
    return await _viewOrIdentify(() => remoteDataSource.identify(phone: phone));
  }

  @override
  Future<Either<Failure, ProfileEntity>> view({required int id}) async {
    return await _viewOrIdentify(() => remoteDataSource.view(id: id));
  }

  Future<Either<Failure, ProfileEntity>> _viewOrIdentify(_IdentifyOrViewChooser identifyOrView) async {
    try {
      if (await networkInfo.online) {
        final remoteProfile = await identifyOrView();
        await localDataSource.cacheProfile(model: remoteProfile);
        return Right(remoteProfile);
      } else {
        return Left(InteretDisconnectedFailure());
      }
    } on ProfileNotFoundException {
      return Left(ProfileNotFoundFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
