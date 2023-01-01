import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/bank_account/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/owner/bank_account/data/repository/owner_bank_account_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late OwnerBankAccountRepositoryImpl repository;

  late MockOwnerBankAccountRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockOwnerBankAccountRemoteDataSource();

    repository = OwnerBankAccountRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final int ownerId = 0;
  final int bankId = 0;
  final String name = "";
  final String accountNumber = "";
  final String branch = "";

  final bool result = true;

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.add(
      ownerId: ownerId,
      bankId: bankId,
      name: name,
      accountNumber: accountNumber,
      branch: branch,
    );

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
        mockRemoteDataSource.add(
          ownerId: ownerId,
          bankId: bankId,
          name: name,
          accountNumber: accountNumber,
          branch: branch,
        ),
      ).thenAnswer((_) async => result);

      // act
      final tResult = await repository.add(
        ownerId: ownerId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      );

      // assert
      verify(
        mockRemoteDataSource.add(
          ownerId: ownerId,
          bankId: bankId,
          name: name,
          accountNumber: accountNumber,
          branch: branch,
        ),
      );
      verifyNoMoreInteractions(mockRemoteDataSource);
      expect(tResult, equals(Right(result)));
    });
  });

  runOfflineTest(() {
    test("should not call remote data source", () async {
      // arrange

      // act
      final result = await repository.add(
        ownerId: ownerId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      );

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
}
