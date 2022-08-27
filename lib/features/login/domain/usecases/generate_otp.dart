import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/generate_otp.dart';
import '../repositories/login.dart';

class GenerateOtpUseCase {
  final LoginRepository repository;

  GenerateOtpUseCase(this.repository);

  Future<Either<Failure, GenerateOtpEntity>> call({required String phone}) async {
    return await repository.generateOtp(phone);
  }
}
