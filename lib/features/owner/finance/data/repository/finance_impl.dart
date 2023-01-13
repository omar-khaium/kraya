import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_info.dart';
import '../datasource/remote.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/repository/finance.dart';

class FinanceRepositoryImpl extends FinanceRepository {
  final FinanceRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FinanceRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, int>> overview() async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.overview();
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
