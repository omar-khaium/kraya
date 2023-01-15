import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/network/network_info.dart';
import '../../../../../core/error/exceptions.dart';
import '../../domain/entity/full_profile.dart';
import '../../domain/repository/profile.dart';
import '../datasource/remote.dart';

class TenantProfileRepositoryImpl extends TenantProfileRepository {
  late TenantProfileRemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;

  TenantProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TenantFullProfileEntity>> fullProfile({required int tenantId}) async {
    try {
      if (await networkInfo.online) {
        final remoteProfile = await remoteDataSource.fullProfile(tenantId: tenantId);
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

  @override
  Future<Either<Failure, bool>> update({
    required int tenantId,
    required String nidNumber,
    required String passportNumber,
    required String email,
    required int religion,
    required String fatherName,
    required String address,
    required String occupation,
    required String jobAddress,
    required File? nidPhoto,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.update(
        tenantId: tenantId,
        nidNumber: nidNumber,
        passportNumber: passportNumber,
        email: email,
        religion: religion,
        fatherName: fatherName,
        address: address,
        occupation: occupation,
        jobAddress: jobAddress,
        nidPhoto: nidPhoto,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
