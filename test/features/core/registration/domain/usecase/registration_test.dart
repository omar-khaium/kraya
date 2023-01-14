import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:kraya_backend/features/core/registration/domain/repository/registration.mocks.dart';
import 'package:kraya_backend/features/core/registration/domain/usecase/registration.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late RegistrationUsecase usecase;
  late MockRegistrationRepository mockRepository;

  setUp(() {
    mockRepository = MockRegistrationRepository();
    usecase = RegistrationUsecase(mockRepository);
  });

  final String firstName = "";
  final String lastName = "";
  final String phone = "";
  final String email = "";
  final DateTime dateOfBirth = DateTime(2000);
  final int gender = -1;
  final int role = -1;
  final File? profilePicture = null;

  final String guid = "";

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.submit(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        dateOfBirth: dateOfBirth,
        gender: gender,
        role: role,
        email: email,
        profilePicture: profilePicture,
      ),
    ).thenAnswer((_) async => Right(guid));

    // act
    final tResult = await usecase(RegistrationParams(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
      role: role,
      email: email,
      profilePicture: profilePicture,
    ));

    // assert
    expect(tResult, Right(guid));
    verify(mockRepository.submit(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
      role: role,
      email: email,
      profilePicture: profilePicture,
    ));
    verifyNoMoreInteractions(mockRepository);
  });
}
