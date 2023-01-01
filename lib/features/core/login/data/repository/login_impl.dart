import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repository/login.dart';
import '../datasource/remote.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ConfirmationResult>> generateOtp({required String phone}) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.generateOtp(phone: phone);
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
  Future<Either<Failure, ConfirmationResult>> resendOtp({required String phone}) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.resendOtp(phone: phone);
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOtp({required ConfirmationResult confirmationResult, required String code}) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.verify(confirmationResult: confirmationResult, code: code);
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
