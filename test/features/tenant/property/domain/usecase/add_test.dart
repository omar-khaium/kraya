import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/tenant/property/domain/repository/property.mocks.dart';
import 'package:kraya_backend/features/tenant/property/domain/usecase/add.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantAddPropertyUsecase usecase;
  late MockTenantPropertyRepository mockRepository;

  setUp(() {
    mockRepository = MockTenantPropertyRepository();
    usecase = TenantAddPropertyUsecase(mockRepository);
  });

  final int tenantId = 0;
  final int propertyId = 0;

  final bool result = true;

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.add(
        tenantId: tenantId,
        propertyId: propertyId,
      ),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      TenantAddPropertyParams(
        tenantId: tenantId,
        propertyId: propertyId,
      ),
    );

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.add(
        tenantId: tenantId,
        propertyId: propertyId,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
