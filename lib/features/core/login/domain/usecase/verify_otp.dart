import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/login.dart';

class VerifyOtpUsecase extends Usecase<bool, VerifyOtpParam> {
  final LoginRepository _repository;

  VerifyOtpUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(VerifyOtpParam param) async {
    return await _repository.verifyOtp(confirmationResult: param.confirmationResult, code: param.code);
  }
}

class VerifyOtpParam extends Equatable {
  final ConfirmationResult confirmationResult;
  final String code;

  VerifyOtpParam({required this.confirmationResult, required this.code});

  @override
  List<Object?> get props => [confirmationResult, code];
}
