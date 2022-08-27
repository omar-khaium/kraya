import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/generate_otp.dart';
import '../entities/verify_otp.dart';

abstract class LoginRepository {
  Future<Either<Failure, GenerateOtpEntity>> generateOtp(final String phone);

  Future<Either<Failure, GenerateOtpEntity>> resendOtp(final String phone);

  Future<Either<Failure, VerifyOtpEntity>> verifyOtp(final String phone, final String code);
}
