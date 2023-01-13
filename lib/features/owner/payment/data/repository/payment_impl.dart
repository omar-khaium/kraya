import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entity/payment.dart';
import '../../domain/repository/payment.dart';
import '../datasource/remote.dart';

class OwnerPaymentRepositoryImpl extends OwnerPaymentRepository {
  final OwnerPaymentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerPaymentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PaymentEntity>>> overview() async {
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

  @override
  Future<Either<Failure, bool>> notify({
    required int tenantId,
    required int propertyId,
    required DateTime month,
  }) async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023, 1));
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

  @override
  Future<Either<Failure, bool>> receivePayment({
    required int ownerId,
    required int tenantId,
    required int propertyId,
    required DateTime month,
    required int amount,
  }) async {
    try {
      if (await networkInfo.online) {
        final result = await remoteDataSource.receivePayment(
          ownerId: ownerId,
          tenantId: tenantId,
          propertyId: propertyId,
          month: month,
          amount: amount,
        );
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
