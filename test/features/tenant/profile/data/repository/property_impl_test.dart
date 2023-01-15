import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/error/failures.dart';
import 'package:kraya_backend/core/model/address.dart';
import 'package:kraya_backend/core/model/contact.dart';
import 'package:kraya_backend/core/model/emergency_contact.dart';
import 'package:kraya_backend/core/model/father.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/tenant/profile/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/tenant/profile/data/model/profile.dart';
import 'package:kraya_backend/features/tenant/profile/data/repository/profile_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantProfileRepositoryImpl repository;

  late MockTenantProfileRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockTenantProfileRemoteDataSource();

    repository = TenantProfileRepositoryImpl(
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

  group("update", () {
    final int tenantId = 0;
    final String nidNumber = "";
    final String passportNumber = "";
    final String email = "";
    final int religion = 0;
    final String fatherName = "";
    final String address = "";
    final String occupation = "";
    final String jobAddress = "";

    final bool result = true;

    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.update(
        tenantId: tenantId,
        nidNumber: nidNumber,
        passportNumber: passportNumber,
        email: email,
        religion: religion,
        fatherName: fatherName,
        address: address,
        occupation: occupation,
        jobAddress: jobAddress,
        nidPhoto: null,
      );

      // assert
      verify(mockNetworkInfo.online);
    });

    runOnlineTest(() {
      test("should return remote data when remote call is successful", () async {
        // arrange
        when(
          mockRemoteDataSource.update(
            tenantId: tenantId,
            nidNumber: nidNumber,
            passportNumber: passportNumber,
            email: email,
            religion: religion,
            fatherName: fatherName,
            address: address,
            occupation: occupation,
            jobAddress: jobAddress,
            nidPhoto: null,
          ),
        ).thenAnswer((_) async => result);

        // act
        final tResult = await repository.update(
          tenantId: tenantId,
          nidNumber: nidNumber,
          passportNumber: passportNumber,
          email: email,
          religion: religion,
          fatherName: fatherName,
          address: address,
          occupation: occupation,
          jobAddress: jobAddress,
          nidPhoto: null,
        );

        // assert
        verify(
          mockRemoteDataSource.update(
            tenantId: tenantId,
            nidNumber: nidNumber,
            passportNumber: passportNumber,
            email: email,
            religion: religion,
            fatherName: fatherName,
            address: address,
            occupation: occupation,
            jobAddress: jobAddress,
            nidPhoto: null,
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
        final result = await repository.update(
          tenantId: tenantId,
          nidNumber: nidNumber,
          passportNumber: passportNumber,
          email: email,
          religion: religion,
          fatherName: fatherName,
          address: address,
          occupation: occupation,
          jobAddress: jobAddress,
          nidPhoto: null,
        );

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });

  group("full profile", () {
    final int tenantId = 0;

    final TenantFullProfileModel result = TenantFullProfileModel(
      profile: TenantProfileModel(
        id: 0,
        phone: "",
        firstName: "",
        lastName: "",
        gender: -1,
        role: -1,
        dateOfBirth: DateTime(2000),
        email: "",
      ),
      additional: TenantAdditionalProfileModel(
        nid: null,
        passport: null,
        religion: -1,
        father: FatherModel(name: ""),
        permanentAddress: PermanentAddressModel(label: ""),
      ),
      emergencyContact: EmergencyContactModel(
        name: "",
        relation: -1,
        currentAddress: CurrentAddressModel(label: ""),
        permanentAddress: null,
        contact: ContactModel(phone: ""),
      ),
      familyMembers: [],
    );

    test("should check if device is online", () {
      // arrange
      when(mockNetworkInfo.online).thenAnswer((_) async => true);

      // act
      repository.fullProfile(tenantId: tenantId);

      // assert
      verify(mockNetworkInfo.online);
    });

    runOnlineTest(() {
      test("should return remote data when remote call is successful", () async {
        // arrange
        when(
          mockRemoteDataSource.fullProfile(tenantId: tenantId),
        ).thenAnswer((_) async => result);

        // act
        final tResult = await repository.fullProfile(tenantId: tenantId);

        // assert
        verify(
          mockRemoteDataSource.fullProfile(tenantId: tenantId),
        );
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(tResult, equals(Right(result)));
      });
    });

    runOfflineTest(() {
      test("should not call remote data source", () async {
        // arrange

        // act
        final result = await repository.fullProfile(tenantId: tenantId);

        // assert
        expect(result, equals(Left(InteretDisconnectedFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });
}
