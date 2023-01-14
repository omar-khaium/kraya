import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/tenant/bank_account/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/tenant/bank_account/data/repository/bank_account_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantBankAccountRepositoryImpl repository;

  late MockTenantBankAccountRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockTenantBankAccountRemoteDataSource();

    repository = TenantBankAccountRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final int tenantId = 0;
  final int bankId = 0;
  final String name = "";
  final String accountNumber = "";
  final String branch = "";

  final bool result = true;

  test("should check if device is online", () {
    // arrange
    when(mockNetworkInfo.online).thenAnswer((_) async => true);

    // act
    repository.add(
      tenantId: tenantId,
      bankId: bankId,
      name: name,
      accountNumber: accountNumber,
      branch: branch,
    );

    // assert
    verify(mockNetworkInfo.online);
  });

  void runOnlineTest(Function body) {
    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.online).thenAnswer((_) async => true);
      });
      body.call();
    });
  }

  void runOfflineTest(Function body) {
    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.online).thenAnswer((_) async => false);
      });
      body.call();
    });
  }

  runOnlineTest(() {
    test("should return remote data when remote call is successful", () async {
      // arrange
      when(
        mockRemoteDataSource.add(
          tenantId: tenantId,
          bankId: bankId,
          name: name,
          accountNumber: accountNumber,
          branch: branch,
        ),
      ).thenAnswer((_) async => result);

      // act
      final tResult = await repository.add(
        tenantId: tenantId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      );

      // assert
      verify(
        mockRemoteDataSource.add(
          tenantId: tenantId,
          bankId: bankId,
          name: name,
          accountNumber: accountNumber,
          branch: branch,
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
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      );

      // assert
      expect(result, equals(Left(InteretDisconnectedFailure())));
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
}
