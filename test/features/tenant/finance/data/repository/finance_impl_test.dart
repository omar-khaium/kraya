import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/tenant/finance/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/tenant/finance/data/repository/finance_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantFinanceRepositoryImpl repository;

  late MockTenantFinanceRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockTenantFinanceRemoteDataSource();

    repository = TenantFinanceRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final int tenantId = 0;
  final DateTime from = DateTime(2000);
  final DateTime to = DateTime(2001);

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.overview(tenantId: tenantId, from: from, to: to);

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
      when(mockDataSource.overview(tenantId: tenantId, from: from, to: to)).thenAnswer((_) async => results);

      // act
      final tResult = await repository.overview(tenantId: tenantId, from: from, to: to);

      // assert
      expect(tResult, equals(Right(results)));
      verify(mockDataSource.overview(tenantId: tenantId, from: from, to: to));
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering ServerException in remote data source", () async {
      // arrange
      when(mockDataSource.overview(tenantId: tenantId, from: from, to: to)).thenThrow(ServerException(""));

      // act
      final tResult = await repository.overview(tenantId: tenantId, from: from, to: to);

      // assert
      expect(tResult, equals(Left(ServerFailure())));
      verify(mockDataSource.overview(tenantId: tenantId, from: from, to: to));
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering SocketException in remote data source", () async {
      // arrange
      when(mockDataSource.overview(tenantId: tenantId, from: from, to: to)).thenThrow(SocketException(""));

      // act
      final tResult = await repository.overview(tenantId: tenantId, from: from, to: to);

      // assert
      expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
      verify(mockDataSource.overview(tenantId: tenantId, from: from, to: to));
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  runOfflineTest(() {
    test("should return a internet disconnected failure if device is offline", () async {
      // arrange

      // act
      final result = await repository.overview(tenantId: tenantId, from: from, to: to);

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockDataSource);
    });
  });
}
