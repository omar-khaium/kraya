import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/payment/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/owner/payment/data/model/payment.dart';
import 'package:kraya_backend/features/owner/payment/data/repository/payment_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late OwnerPaymentRepositoryImpl repository;

  late MockOwnerPaymentRemoteDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockDataSource = MockOwnerPaymentRemoteDataSource();

    repository = OwnerPaymentRepositoryImpl(
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

  group("overview", () {
    runOnlineTest(() {
      final results = [
        PaymentModel(
          id: 0,
          propertyId: 0,
          amount: 0,
          status: -1,
          date: DateTime(2000),
        )
      ];

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
  });

  group("notify", () {
    runOnlineTest(() {
      final results = true;

      test("should return remote data when remote call is successful", () async {
        // arrange
        when(mockDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023))).thenAnswer((_) async => results);

        // act
        final tResult = await repository.notify(tenantId: 1, propertyId: 1, month: DateTime(2023));

        // assert
        expect(tResult, equals(Right(results)));
        verify(mockDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023)));
        verifyNoMoreInteractions(mockDataSource);
      });

      test("should return ServerFailure while encountering ServerException in remote data source", () async {
        // arrange
        when(mockDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023))).thenThrow(ServerException(""));

        // act
        final tResult = await repository.notify(tenantId: 1, propertyId: 1, month: DateTime(2023));

        // assert
        expect(tResult, equals(Left(ServerFailure())));
        verify(mockDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023)));
        verifyNoMoreInteractions(mockDataSource);
      });

      test("should return ServerFailure while encountering SocketException in remote data source", () async {
        // arrange
        when(mockDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023))).thenThrow(SocketException(""));

        // act
        final tResult = await repository.notify(tenantId: 1, propertyId: 1, month: DateTime(2023));

        // assert
        expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
        verify(mockDataSource.notify(tenantId: 1, propertyId: 1, month: DateTime(2023)));
        verifyNoMoreInteractions(mockDataSource);
      });
    });

    runOfflineTest(() {
      test("should return a internet disconnected failure if device is offline", () async {
        // arrange

        // act
        final result = await repository.notify(tenantId: 1, propertyId: 1, month: DateTime(2023, 1));

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockDataSource);
      });
    });
  });

  group("receive payment", () {
    runOnlineTest(() {
      final results = true;

      test("should return remote data when remote call is successful", () async {
        // arrange
        when(
          mockDataSource.receivePayment(
            ownerId: 1,
            tenantId: 1,
            propertyId: 1,
            month: DateTime(2023),
            amount: 0,
          ),
        ).thenAnswer((_) async => results);

        // act
        final tResult = await repository.receivePayment(
          ownerId: 1,
          tenantId: 1,
          propertyId: 1,
          month: DateTime(2023),
          amount: 0,
        );

        // assert
        expect(tResult, equals(Right(results)));
        verify(
          mockDataSource.receivePayment(
            ownerId: 1,
            tenantId: 1,
            propertyId: 1,
            month: DateTime(2023),
            amount: 0,
          ),
        );
        verifyNoMoreInteractions(mockDataSource);
      });

      test("should return ServerFailure while encountering ServerException in remote data source", () async {
        // arrange
        when(
          mockDataSource.receivePayment(
            ownerId: 1,
            tenantId: 1,
            propertyId: 1,
            month: DateTime(2023),
            amount: 0,
          ),
        ).thenThrow(ServerException(""));

        // act
        final tResult = await repository.receivePayment(
          ownerId: 1,
          tenantId: 1,
          propertyId: 1,
          month: DateTime(2023),
          amount: 0,
        );

        // assert
        expect(tResult, equals(Left(ServerFailure())));
        verify(
          mockDataSource.receivePayment(ownerId: 1, tenantId: 1, propertyId: 1, month: DateTime(2023), amount: 0),
        );
        verifyNoMoreInteractions(mockDataSource);
      });

      test("should return ServerFailure while encountering SocketException in remote data source", () async {
        // arrange
        when(
          mockDataSource.receivePayment(ownerId: 1, tenantId: 1, propertyId: 1, month: DateTime(2023), amount: 0),
        ).thenThrow(SocketException(""));

        // act
        final tResult = await repository.receivePayment(
          ownerId: 1,
          tenantId: 1,
          propertyId: 1,
          month: DateTime(2023),
          amount: 0,
        );

        // assert
        expect(tResult, equals(Left(ServerFailure("Internet connection isn't stable"))));
        verify(
          mockDataSource.receivePayment(
            ownerId: 1,
            tenantId: 1,
            propertyId: 1,
            month: DateTime(2023),
            amount: 0,
          ),
        );
        verifyNoMoreInteractions(mockDataSource);
      });
    });

    runOfflineTest(() {
      test("should return a internet disconnected failure if device is offline", () async {
        // arrange

        // act
        final result = await repository.receivePayment(
          ownerId: 1,
          tenantId: 1,
          propertyId: 1,
          month: DateTime(2023, 1),
          amount: 0,
        );

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockDataSource);
      });
    });
  });
}
