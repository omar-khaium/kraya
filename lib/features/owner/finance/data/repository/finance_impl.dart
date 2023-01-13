import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repository/finance.dart';
import '../datasource/remote.dart';

class OwnerFinanceRepositoryImpl extends OwnerFinanceRepository {
  final OwnerFinanceRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerFinanceRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, int>> overview({required int ownerId, required DateTime from, required DateTime to}) async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.overview(ownerId: ownerId, from: from, to: to);
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
