import 'dart:io';

import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<RegistrationRemoteDataSource>()])
abstract class RegistrationRemoteDataSource {
  Future<String> submit({
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
