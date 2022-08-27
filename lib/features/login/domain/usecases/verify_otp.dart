import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/verify_otp.dart';
import '../repositories/login.dart';

class VerifyOtpUseCase implements Usecase<VerifyOtpEntity, Params> {
  final LoginRepository repository;

  VerifyOtpUseCase(this.repository);

  @override
  Future<Either<Failure, VerifyOtpEntity>> call(Params params) async {
    return await repository.verifyOtp(params.phone, params.code);
  }
}

class Params {
  final String phone;
  final String code;

  Params({required this.phone, required this.code});
}
