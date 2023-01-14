import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<RegistrationRepository>()])
abstract class RegistrationRepository {
  Future<Either<Failure, String>> submit({
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
    required DateTime dateOfBirth,
    required int gender,
    required int role,
    File? profilePicture,
  });
}
