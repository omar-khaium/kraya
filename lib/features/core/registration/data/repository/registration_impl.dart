import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/enum/enums.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repository/registration.dart';
import '../datasource/remote.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  final RegistrationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RegistrationRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, String>> submit({
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
    required DateTime dateOfBirth,
    required Gender gender,
    required Role role,
    File? profilePicture,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.submit(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        dateOfBirth: dateOfBirth,
        gender: gender,
        role: role,
        profilePicture: profilePicture,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
