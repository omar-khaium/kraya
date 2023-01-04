import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/bill/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/owner/bill/data/repository/bill_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late OwnerBillRepositoryImpl repository;

  late MockOwnerBillRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockOwnerBillRemoteDataSource();

    repository = OwnerBillRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final int ownerId = 0;
  final int propertyId = 0;
  final String name = "";
  final int amount = 0;
  final int extra = 0;

  final bool result = true;

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.add(
      ownerId: ownerId,
      propertyId: propertyId,
      name: name,
      amount: amount,
      extra: extra,
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
          propertyId: propertyId,
          name: name,
          amount: amount,
          extra: extra,
        ),
      ).thenAnswer((_) async => result);

      // act
      final tResult = await repository.add(
        ownerId: ownerId,
        propertyId: propertyId,
        name: name,
        amount: amount,
        extra: extra,
      );

      // assert
      verify(
        mockRemoteDataSource.add(
          ownerId: ownerId,
          propertyId: propertyId,
          name: name,
          amount: amount,
          extra: extra,
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
        propertyId: propertyId,
        name: name,
        amount: amount,
        extra: extra,
      );

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
}
