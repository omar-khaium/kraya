import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/tenant/property/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/tenant/property/data/repository/property_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantPropertyRepositoryImpl repository;

  late MockTenantPropertyRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockTenantPropertyRemoteDataSource();

    repository = TenantPropertyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
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

  group("all properties", () {
    final int tenantId = 0;

    final List<int> result = [];

    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.getAll(tenantId: tenantId);

      // assert
      verify(mockNetworkInfo.online);
    });

    runOnlineTest(() {
      test("should return remote data when remote call is successful", () async {
        // arrange
        when(
          mockRemoteDataSource.getAll(tenantId: tenantId),
        ).thenAnswer((_) async => result);

        // act
        final tResult = await repository.getAll(tenantId: tenantId);

        // assert
        verify(
          mockRemoteDataSource.getAll(tenantId: tenantId),
        );
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult, equals(Right(result)));
      });
    });

    runOfflineTest(() {
      test("should not call remote data source", () async {
        // arrange

        // act
        final result = await repository.getAll(tenantId: tenantId);

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });

  group("search", () {
    final String keyword = "";
    final int typeId = 0;
    final int subTypeId = 0;

    final List<int> result = [];

    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.search(
        keyword: keyword,
        typeId: typeId,
        subTypeId: subTypeId,
      );

      // assert
      verify(mockNetworkInfo.online);
    });

    runOnlineTest(() {
      test("should return remote data when remote call is successful", () async {
        // arrange
        when(
          mockRemoteDataSource.search(
            keyword: keyword,
            typeId: typeId,
            subTypeId: subTypeId,
          ),
        ).thenAnswer((_) async => result);

        // act
        final tResult = await repository.search(
          keyword: keyword,
          typeId: typeId,
          subTypeId: subTypeId,
        );

        // assert
        verify(
          mockRemoteDataSource.search(
            keyword: keyword,
            typeId: typeId,
            subTypeId: subTypeId,
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
        final result = await repository.search(
          keyword: keyword,
          typeId: typeId,
          subTypeId: subTypeId,
        );

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });

  group("add", () {
    final int tenantId = 0;
    final int propertyId = 0;

    final bool result = true;

    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.add(
        tenantId: tenantId,
        propertyId: propertyId,
      );

      // assert
      verify(mockNetworkInfo.online);
    });

    runOnlineTest(() {
      test("should return remote data when remote call is successful", () async {
        // arrange
        when(
          mockRemoteDataSource.add(
            tenantId: tenantId,
            propertyId: propertyId,
          ),
        ).thenAnswer((_) async => result);

        // act
        final tResult = await repository.add(
          tenantId: tenantId,
          propertyId: propertyId,
        );

        // assert
        verify(
          mockRemoteDataSource.add(
            tenantId: tenantId,
            propertyId: propertyId,
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
          tenantId: tenantId,
          propertyId: propertyId,
        );

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });
}
