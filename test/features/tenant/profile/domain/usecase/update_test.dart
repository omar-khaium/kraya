import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/tenant/profile/domain/repository/profile.mocks.dart';
import 'package:kraya_backend/features/tenant/profile/domain/usecase/update.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantUpdateProfileUsecase usecase;
  late MockTenantProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockTenantProfileRepository();
    usecase = TenantUpdateProfileUsecase(mockRepository);
  });

  final int tenantId = 0;
  final String nidNumber = "";
  final String passportNumnber = "";
  final String email = "";
  final int religion = -1;
  final String fatherName = "";
  final String address = "";
  final String occupation = "";
  final String jobAddress = "";
  final File? nidPhoto = null;

  final bool result = true;

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.update(
          tenantId: tenantId,
          nidNumber: nidNumber,
          passportNumnber: passportNumnber,
          email: email,
          religion: religion,
          fatherName: fatherName,
          address: address,
          occupation: occupation,
          jobAddress: jobAddress,
          nidPhoto: nidPhoto),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      TenantUpdateProfileParam(
        tenantId: tenantId,
        nidNumber: nidNumber,
        passportNumnber: passportNumnber,
        email: email,
        religion: religion,
        fatherName: fatherName,
        address: address,
        occupation: occupation,
        jobAddress: jobAddress,
        nidPhoto: nidPhoto,
      ),
    );

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.update(
        tenantId: tenantId,
        nidNumber: nidNumber,
        passportNumnber: passportNumnber,
        email: email,
        religion: religion,
        fatherName: fatherName,
        address: address,
        occupation: occupation,
        jobAddress: jobAddress,
        nidPhoto: nidPhoto,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
