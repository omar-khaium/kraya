import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/promotion/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/owner/promotion/data/model/banner.dart';
import 'package:kraya_backend/features/owner/promotion/data/repository/banner_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late OwnerBannerPromotionRepositoryImpl repository;

  late MockOwnerBannerPromotionRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockOwnerBannerPromotionRemoteDataSource();

    repository = OwnerBannerPromotionRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.getAll();

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
    final results = [
      BannerModel(
        url: "",
        action: "",
        expiresAt: DateTime(2000),
      ),
    ];

    test("should return remote data when remote call is successful", () async {
      // arrange
      when(mockDataSource.getAll()).thenAnswer((_) async => results);

      // act
      final tResult = await repository.getAll();

      // assert
      expect(tResult, equals(Right(results)));
      verify(mockDataSource.getAll());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering ServerException in remote data source", () async {
      // arrange
      when(mockDataSource.getAll()).thenThrow(ServerException(""));

      // act
      final tResult = await repository.getAll();

      // assert
      expect(tResult, equals(Left(ServerFailure())));
      verify(mockDataSource.getAll());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering SocketException in remote data source", () async {
      // arrange
      when(mockDataSource.getAll()).thenThrow(SocketException(""));

      // act
      final tResult = await repository.getAll();

      // assert
      expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
      verify(mockDataSource.getAll());
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  runOfflineTest(() {
    test("should return a internet disconnected failure if device is offline", () async {
      // arrange

      // act
      final result = await repository.getAll();

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockDataSource);
    });
  });
}
