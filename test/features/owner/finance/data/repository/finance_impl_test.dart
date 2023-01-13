import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/finance/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/owner/finance/data/repository/finance_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late FinanceRepositoryImpl repository;

  late MockFinanceRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockFinanceRemoteDataSource();

    repository = FinanceRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.overview();

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
    final results = 0;

    test("should return remote data when remote call is successful", () async {
      // arrange
      when(mockDataSource.overview()).thenAnswer((_) async => results);

      // act
      final tResult = await repository.overview();

      // assert
      expect(tResult, equals(Right(results)));
      verify(mockDataSource.overview());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering ServerException in remote data source", () async {
      // arrange
      when(mockDataSource.overview()).thenThrow(ServerException(""));

      // act
      final tResult = await repository.overview();

      // assert
      expect(tResult, equals(Left(ServerFailure())));
      verify(mockDataSource.overview());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering SocketException in remote data source", () async {
      // arrange
      when(mockDataSource.overview()).thenThrow(SocketException(""));

      // act
      final tResult = await repository.overview();

      // assert
      expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
      verify(mockDataSource.overview());
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  runOfflineTest(() {
    test("should return a internet disconnected failure if device is offline", () async {
      // arrange

      // act
      final result = await repository.overview();

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockDataSource);
    });
  });
}
