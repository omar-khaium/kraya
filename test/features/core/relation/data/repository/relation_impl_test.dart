import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/relation/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/core/relation/data/model/relation.dart';
import 'package:kraya_backend/features/core/relation/data/repository/relation_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late RelationRepositoryImpl repository;

  late MockRelationRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockRelationRemoteDataSource();

    repository = RelationRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.getAllRelations();

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
    final results = [RelationModel(id: 0, type: "")];

    test("should return remote data when remote call is successful", () async {
      // arrange
      when(mockDataSource.getAllRelations()).thenAnswer((_) async => results);

      // act
      final tResult = await repository.getAllRelations();

      // assert
      expect(tResult, equals(Right(results)));
      verify(mockDataSource.getAllRelations());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering ServerException in remote data source", () async {
      // arrange
      when(mockDataSource.getAllRelations()).thenThrow(ServerException(""));

      // act
      final tResult = await repository.getAllRelations();

      // assert
      expect(tResult, equals(Left(ServerFailure())));
      verify(mockDataSource.getAllRelations());
      verifyNoMoreInteractions(mockDataSource);
    });

    test("should return ServerFailure while encountering SocketException in remote data source", () async {
      // arrange
      when(mockDataSource.getAllRelations()).thenThrow(SocketException(""));

      // act
      final tResult = await repository.getAllRelations();

      // assert
      expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
      verify(mockDataSource.getAllRelations());
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  runOfflineTest(() {
    test("should return a internet disconnected failure if device is offline", () async {
      // arrange

      // act
      final result = await repository.getAllRelations();

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockDataSource);
    });
  });
}
