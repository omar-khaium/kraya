import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/feature/data/datasource/feature.mocks.dart';
import 'package:kraya_backend/features/core/feature/data/model/feature.dart';
import 'package:kraya_backend/features/core/feature/data/repository/feature_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late FeatureRepositoryImpl repository;

  late MockFeatureRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockFeatureRemoteDataSource();

    repository = FeatureRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.getAllFeatures();

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
    final results = [FeatureModel(id: 0, name: "")];

    test("should return remote data when remote call is successful", () async {
      // arrange
      when(mockDataSource.getAllFeatures()).thenAnswer((_) async => results);

      // act
      final tResult = await repository.getAllFeatures();

      // assert
      expect(tResult, equals(Right(results)));
      verify(mockDataSource.getAllFeatures());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering ServerException in remote data source", () async {
      // arrange
      when(mockDataSource.getAllFeatures()).thenThrow(ServerException(""));

      // act
      final tResult = await repository.getAllFeatures();

      // assert
      expect(tResult, equals(Left(ServerFailure())));
      verify(mockDataSource.getAllFeatures());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering SocketException in remote data source", () async {
      // arrange
      when(mockDataSource.getAllFeatures()).thenThrow(SocketException(""));

      // act
      final tResult = await repository.getAllFeatures();

      // assert
      expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
      verify(mockDataSource.getAllFeatures());
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  runOfflineTest(() {
    test("should return a internet disconnected failure if device is offline", () async {
      // arrange

      // act
      final result = await repository.getAllFeatures();

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockDataSource);
    });
  });
}
