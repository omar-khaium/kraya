import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entity/bank.dart';
import '../../domain/repository/bank.dart';
import '../datasource/remote.dart';

class BankRepositoryImpl extends BankRepository {
  final BankRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BankRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BankEntity>>> getAllBanks() async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.getAllBanks();
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
