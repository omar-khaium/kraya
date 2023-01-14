import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/model/availability.dart';
import 'package:kraya_backend/features/core/property/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/core/property/data/model/bills.dart';
import 'package:kraya_backend/features/core/property/data/model/details.dart';
import 'package:kraya_backend/features/core/property/data/repository/property_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';

void main() {
  late PropertyRepositoryImpl repository;

  late MockPropertyRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockPropertyRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = PropertyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final tPropertyId = 0;

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.details(id: tPropertyId);

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

  group("details", () {
    final tModel = PropertyDetailsModel(
      id: tPropertyId,
      ownerId: 0,
      tenantId: 0,
      propertyType: -1,
      propertySubType: -1,
      buildingName: "",
      flatName: "",
      address: "",
      size: 0,
      room: 0,
      bathroom: 0,
      balcony: 0,
      advance: 0,
      rent: 0,
      description: "",
      availability: AvailabilityModel(available: true, from: DateTime(2000)),
      pictures: [],
      features: [],
      createdAt: DateTime(2000),
    );
    runOnlineTest(() {
      test("should return remote data when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.details(id: tPropertyId)).thenAnswer((_) async => tModel);

        // act
        final tResult = await repository.details(id: tPropertyId);

        // assert
        verify(mockRemoteDataSource.details(id: tPropertyId));
        expect(tResult, equals(Right(tModel)));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });
      test("should cache the data locally when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.details(id: tPropertyId)).thenAnswer((_) async => tModel);

        // act
        await repository.details(id: tPropertyId);

        // assert
        verify(mockRemoteDataSource.details(id: tPropertyId));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });

      test("should throw [ServerException] when remote data source call is failed", () async {
        // arrange
        when(mockRemoteDataSource.details(id: tPropertyId)).thenThrow(ServerException("Something went wrong"));

        // act
        final tResult = await repository.details(id: tPropertyId);

        // assert
        verify(mockRemoteDataSource.details(id: tPropertyId));
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(ServerFailure("Something went wrong")));
      });
    });

    runOfflineTest(() {
      test("should not call remote data source", () async {
        // arrange

        // act
        final result = await repository.details(id: tPropertyId);

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });

  group("bills", () {
    final tModel = PropertyBillsModel(
      total: 10,
      bills: [
        BillModel(
          name: "",
          amount: 10,
        ),
      ],
    );
    runOnlineTest(() {
      test("should return remote data when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.bills(id: tPropertyId)).thenAnswer((_) async => tModel);

        // act
        final tResult = await repository.bills(id: tPropertyId);

        // assert
        verify(mockRemoteDataSource.bills(id: tPropertyId));
        expect(tResult, equals(Right(tModel)));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });
      test("should cache the data locally when remote data source call is successful", () async {
        // arrange
        when(mockRemoteDataSource.bills(id: tPropertyId)).thenAnswer((_) async => tModel);

        // act
        await repository.bills(id: tPropertyId);

        // assert
        verify(mockRemoteDataSource.bills(id: tPropertyId));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });

      test("should throw [ServerException] when remote data source call is failed", () async {
        // arrange
        when(mockRemoteDataSource.bills(id: tPropertyId)).thenThrow(ServerException("Something went wrong"));

        // act
        final tResult = await repository.bills(id: tPropertyId);

        // assert
        verify(mockRemoteDataSource.bills(id: tPropertyId));
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult.isLeft(), true);
        expect(tResult, Left(ServerFailure("Something went wrong")));
      });
    });

    runOfflineTest(() {
      test("should not call remote data source", () async {
        // arrange

        // act
        final result = await repository.bills(id: tPropertyId);

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });
}
