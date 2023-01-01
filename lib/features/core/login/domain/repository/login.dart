import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<LoginRepository>()])
abstract class LoginRepository {
  Future<Either<Failure, ConfirmationResult>> generateOtp({required String phone});
  Future<Either<Failure, ConfirmationResult>> resendOtp({required String phone});
  Future<Either<Failure, bool>> verifyOtp({required ConfirmationResult confirmationResult, required String code});
}
