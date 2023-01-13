import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entity/feature.dart';
import '../../domain/repository/feature.dart';
import '../datasource/feature.dart';

class FeatureRepositoryImpl extends FeatureRepository {
  final FeatureRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FeatureRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<FeatureEntity>>> getAllFeatures() async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.getAllFeatures();
        return Right(result);
      } else {
        return Left(InteretDisconnectedFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure("Internet connection isn't stable"));
    }
  }
}
