import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repository/banner.dart';
import '../datasource/remote.dart';
import '../model/banner.dart';

class OwnerBannerPromotionRepositoryImpl extends OwnerBannerPromotionRepository {
  final OwnerBannerPromotionRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerBannerPromotionRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BannerModel>>> getAll() async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.getAll();
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
