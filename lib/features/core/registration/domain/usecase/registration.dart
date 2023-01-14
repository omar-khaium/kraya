import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/registration.dart';

class RegistrationUsecase extends Usecase<String, RegistrationParams> {
  final RegistrationRepository _repository;

  RegistrationUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(param) async {
    return _repository.submit(
      firstName: param.firstName,
      lastName: param.lastName,
      phone: param.phone,
      email: param.email,
      dateOfBirth: param.dateOfBirth,
      gender: param.gender,
      role: param.role,
      profilePicture: param.profilePicture,
    );
  }
}

class RegistrationParams {
  final String firstName;
  final String lastName;
  final String phone;
  final String? email;
  final DateTime dateOfBirth;
  final int gender;
  final int role;
  final File? profilePicture;

  RegistrationParams({
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.email,
    required this.dateOfBirth,
    required this.gender,
    required this.role,
    this.profilePicture,
  });
}
