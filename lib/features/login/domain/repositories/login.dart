import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/generate_otp.dart';

abstract class LoginRepository {
  Future<Either<Failure, GenerateOtp>> generateOtp(final String number);
  Future<Either<Failure, GenerateOtp>> resendOtp(final String number);
}
