import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/generate_otp.dart';
import '../repositories/login.dart';

class GenerateOtpUseCase implements Usecase<GenerateOtpEntity, Params> {
  final LoginRepository repository;

  GenerateOtpUseCase(this.repository);

  @override
  Future<Either<Failure, GenerateOtpEntity>> call(Params params) async {
    return await repository.generateOtp(params.phone);
  }
}

class Params {
  final String phone;

  Params({required this.phone});
}
