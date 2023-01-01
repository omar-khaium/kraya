import 'dart:io';

import 'package:mockito/annotations.dart';

import '../../../../../core/enum/enums.dart';

@GenerateNiceMocks([MockSpec<RegistrationRemoteDataSource>()])
abstract class RegistrationRemoteDataSource {
  Future<String> submit({
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
    required DateTime dateOfBirth,
    required Gender gender,
    required Role role,
    File? profilePicture,
  });
}
