import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_info.dart';
import '../datasource/remote.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entity/relation.dart';
import '../../domain/repository/relation.dart';

class RelationRepositoryImpl extends RelationRepository {
  final RelationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RelationRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<RelationEntity>>> getAllRelations() async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.getAllRelations();
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
