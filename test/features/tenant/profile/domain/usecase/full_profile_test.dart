import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/entity/address.dart';
import 'package:kraya_backend/core/entity/contact.dart';
import 'package:kraya_backend/core/entity/emergency_contact.dart';
import 'package:kraya_backend/core/entity/father.dart';
import 'package:kraya_backend/core/entity/nid.dart';
import 'package:kraya_backend/core/entity/passport.dart';
import 'package:kraya_backend/features/tenant/profile/domain/entity/full_profile.dart';
import 'package:kraya_backend/features/tenant/profile/domain/repository/profile.mocks.dart';
import 'package:kraya_backend/features/tenant/profile/domain/usecase/full_profile.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantFullProfileUsecase usecase;
  late MockTenantProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockTenantProfileRepository();
    usecase = TenantFullProfileUsecase(mockRepository);
  });

  final int tenantId = 0;

  final TenantFullProfileEntity result = TenantFullProfileEntity(
    profile: TenantProfileEntity(
      id: 0,
      phone: "",
      firstName: "",
      lastName: "",
      gender: -1,
      role: -1,
      dateOfBirth: DateTime(2000),
    ),
    additional: TenantAdditionalProfileEntity(
      nid: NIDEntity(
        number: "",
        frontSide: "",
        backSide: null,
      ),
      passport: PassportEntity(
        number: "",
        photoUrl: "",
      ),
      religion: -1,
      father: FatherEntity(name: ""),
      permanentAddress: PermanentAddressEntity(label: ""),
    ),
    emergencyContact: EmergencyContactEntity(
      name: "",
      relation: -1,
      currentAddress: CurrentAddressEntity(label: ""),
      permanentAddress: PermanentAddressEntity(label: ""),
      contact: ContactEntity(phone: ""),
    ),
    familyMembers: [],
  );

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.fullProfile(tenantId: tenantId),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(tenantId);

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.fullProfile(tenantId: tenantId),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
