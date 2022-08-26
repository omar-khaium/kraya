import 'package:dartz/dartz.dart';
import 'package:kraya/core/error/failures.dart';
import 'package:kraya/features/login/domain/entities/generate_otp.dart';
import 'package:kraya/features/login/domain/repositories/login.dart';

class GenerateOtpUseCase {
  final LoginRepository repository;

  GenerateOtpUseCase(this.repository);

  Future<Either<Failure, GenerateOtpEntity>> execute({required String phone}) async {
    return await repository.generateOtp(phone);
  }
}
