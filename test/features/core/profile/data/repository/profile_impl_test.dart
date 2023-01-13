import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/remote.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/local.mocks.dart';
import 'package:kraya_backend/features/core/profile/data/model/profile.dart';
import 'package:kraya_backend/features/core/profile/data/repository/profile_impl.dart';

void main() {
  late ProfileRepositoryImpl repository;

  late MockProfileRemoteDataSource mockRemoteDataSource;
  late MockProfileLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockProfileRemoteDataSource();
    mockLocalDataSource = MockProfileLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = ProfileRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("identify", () {
    final tPhone = "01647376463";
    final tModel = ProfileModel(
      id: 0,
      phone: tPhone,
      firstName: "",
      lastName: "",
      gender: Gender.none,
      role: Role.none,
      dateOfBirth: DateTime(1970, 1, 1, 6, 0),
    );
    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.identify(phone: tPhone);

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
      test("should return remote data when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.identify(phone: tPhone)).thenAnswer((_) async => tModel);

        // act
        final tResult = await repository.identify(phone: tPhone);

        // assert
        verify(mockRemoteDataSource.identify(phone: tPhone));
        expect(tResult, equals(Right(tModel)));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });
      test("should cache the data locally when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.identify(phone: tPhone)).thenAnswer((_) async => tModel);

        // act
        await repository.identify(phone: tPhone);

        // assert
        verify(mockRemoteDataSource.identify(phone: tPhone));
        verify(mockLocalDataSource.cacheProfile(model: tModel));
        verifyNoMoreInteractions(mockRemoteDataSource);
        verifyNoMoreInteractions(mockLocalDataSource);
      });

      test("should throw [ProfileNotFoundException] when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.identify(phone: tPhone)).thenThrow(ProfileNotFoundException());

        // act
        final tResult = await repository.identify(phone: tPhone);

        // assert
        verify(mockRemoteDataSource.identify(phone: tPhone));
        verifyZeroInteractions(mockLocalDataSource);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(ProfileNotFoundFailure("User not found")));
      });

      test("should throw [ServerException] when remote data source call is failed", () async {
        // arrange
        when(mockRemoteDataSource.identify(phone: tPhone)).thenThrow(ServerException("Something went wrong"));

        // act
        final tResult = await repository.identify(phone: tPhone);

        // assert
        verify(mockRemoteDataSource.identify(phone: tPhone));
        verifyZeroInteractions(mockLocalDataSource);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(ServerFailure("Something went wrong")));
      });

      test("should throw [CacheException] when remote data source call is failed", () async {
        // arrange
        when(mockRemoteDataSource.identify(phone: tPhone)).thenAnswer((_) async => tModel);
        when(mockLocalDataSource.cacheProfile(model: tModel)).thenThrow(CacheException("Restart app"));

        // act
        final tResult = await repository.identify(phone: tPhone);

        // assert
        verify(mockRemoteDataSource.identify(phone: tPhone));
        verify(mockLocalDataSource.cacheProfile(model: tModel));
        verifyNoMoreInteractions(mockLocalDataSource);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(CacheFailure("Restart app")));
      });
    });

    runOfflineTest(() {
      test("should not call remote data source", () async {
        // arrange

        // act
        final result = await repository.identify(phone: tPhone);

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);
      });
    });
  });

  group("view", () {
    final tId = 0;
    final tModel = ProfileModel(
      id: 0,
      phone: "",
      firstName: "",
      lastName: "",
      gender: Gender.none,
      role: Role.none,
      dateOfBirth: DateTime(1970, 1, 1, 6, 0),
    );
    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.view(id: tId);

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
      test("should return remote data when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.view(id: tId)).thenAnswer((_) async => tModel);

        // act
        final tResult = await repository.view(id: tId);

        // assert
        verify(mockRemoteDataSource.view(id: tId));
        expect(tResult, equals(Right(tModel)));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });
      test("should cache the data locally when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.view(id: tId)).thenAnswer((_) async => tModel);

        // act
        await repository.view(id: tId);

        // assert
        verify(mockRemoteDataSource.view(id: tId));
        verify(mockLocalDataSource.cacheProfile(model: tModel));
        verifyNoMoreInteractions(mockRemoteDataSource);
        verifyNoMoreInteractions(mockLocalDataSource);
      });

      test("should throw [ProfileNotFoundException] when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.view(id: tId)).thenThrow(ProfileNotFoundException());

        // act
        final tResult = await repository.view(id: tId);

        // assert
        verify(mockRemoteDataSource.view(id: tId));
        verifyZeroInteractions(mockLocalDataSource);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(ProfileNotFoundFailure("User not found")));
      });

      test("should throw [ServerException] when remote data source call is failed", () async {
        // arrange
        when(mockRemoteDataSource.view(id: tId)).thenThrow(ServerException("Something went wrong"));

        // act
        final tResult = await repository.view(id: tId);

        // assert
        verify(mockRemoteDataSource.view(id: tId));
        verifyZeroInteractions(mockLocalDataSource);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(ServerFailure("Something went wrong")));
      });

      test("should throw [CacheException] when remote data source call is failed", () async {
        // arrange
        when(mockRemoteDataSource.view(id: tId)).thenAnswer((_) async => tModel);
        when(mockLocalDataSource.cacheProfile(model: tModel)).thenThrow(CacheException("Restart app"));

        // act
        final tResult = await repository.view(id: tId);

        // assert
        verify(mockRemoteDataSource.view(id: tId));
        verify(mockLocalDataSource.cacheProfile(model: tModel));
        verifyNoMoreInteractions(mockLocalDataSource);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(CacheFailure("Restart app")));
      });
    });
    runOfflineTest(() {
      test("should not call remote data source", () async {
        // arrange

        // act
        final result = await repository.view(id: tId);

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);
      });
    });
  });
}
