import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/registration/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/core/registration/data/repository/registration_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late RegistrationRepositoryImpl repository;

  late MockRegistrationRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockRegistrationRemoteDataSource();

    repository = RegistrationRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final String firstName = "";
  final String lastName = "";
  final String phone = "";
  final String email = "";
  final DateTime dateOfBirth = DateTime(2000);
  final Gender gender = Gender.none;
  final Role role = Role.none;
  final File? profilePicture = null;

  final String guid = "";

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.submit(firstName: firstName, lastName: lastName, phone: phone, dateOfBirth: dateOfBirth, gender: gender, role: role);

    // assert
    verify(mockNetworkInfo.online);
  });

  void runOnlineTest(Function body) {
    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.online).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runOfflineTest(Function body) {
    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.online).thenAnswer((_) async => false);
      });
      body();
    });
  }

  runOnlineTest(() {
    test("should return remote data when remote call is successful", () async {
      // arrange
      when(
        mockRemoteDataSource.submit(
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          email: email,
          dateOfBirth: dateOfBirth,
          gender: gender,
          role: role,
          profilePicture: profilePicture,
        ),
      ).thenAnswer((_) async => guid);

      // act
      final tResult = await repository.submit(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        dateOfBirth: dateOfBirth,
        gender: gender,
        role: role,
        profilePicture: profilePicture,
      );

      // assert
      verify(mockRemoteDataSource.submit(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        dateOfBirth: dateOfBirth,
        gender: gender,
        role: role,
        profilePicture: profilePicture,
      ));
      verifyNoMoreInteractions(mockRemoteDataSource);
      expect(tResult, equals(Right(guid)));
    });
  });

  runOfflineTest(() {
    test("should not call remote data source", () async {
      // arrange

      // act
      final result = await repository.submit(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        dateOfBirth: dateOfBirth,
        gender: gender,
        role: role,
        profilePicture: profilePicture,
      );

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
}
