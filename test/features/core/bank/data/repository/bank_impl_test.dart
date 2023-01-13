import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/bank/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/core/bank/data/model/bank.dart';
import 'package:kraya_backend/features/core/bank/data/repository/bank_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late BankRepositoryImpl repository;

  late MockBankRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockBankRemoteDataSource();

    repository = BankRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.getAllBanks();

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
    final results = [BankModel(id: 0, name: "", logo: "")];

    test("should return remote data when remote call is successful", () async {
      // arrange
      when(mockDataSource.getAllBanks()).thenAnswer((_) async => results);

      // act
      final tResult = await repository.getAllBanks();

      // assert
      expect(tResult, equals(Right(results)));
      verify(mockDataSource.getAllBanks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering ServerException in remote data source", () async {
      // arrange
      when(mockDataSource.getAllBanks()).thenThrow(ServerException(""));

      // act
      final tResult = await repository.getAllBanks();

      // assert
      expect(tResult, equals(Left(ServerFailure())));
      verify(mockDataSource.getAllBanks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering SocketException in remote data source", () async {
      // arrange
      when(mockDataSource.getAllBanks()).thenThrow(SocketException(""));

      // act
      final tResult = await repository.getAllBanks();

      // assert
      expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
      verify(mockDataSource.getAllBanks());
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  runOfflineTest(() {
    test("should return a internet disconnected failure if device is offline", () async {
      // arrange

      // act
      final result = await repository.getAllBanks();

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockDataSource);
    });
  });
}
