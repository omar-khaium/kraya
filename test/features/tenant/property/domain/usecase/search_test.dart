import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/tenant/property/domain/repository/property.mocks.dart';
import 'package:kraya_backend/features/tenant/property/domain/usecase/search.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantSearchPropertyUsecase usecase;
  late MockTenantPropertyRepository mockRepository;

  setUp(() {
    mockRepository = MockTenantPropertyRepository();
    usecase = TenantSearchPropertyUsecase(mockRepository);
  });

  final String keyword = "";
  final int typeId = 0;
  final int subTypeId = 0;

  final List<int> result = [];

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.search(
        keyword: keyword,
        typeId: typeId,
        subTypeId: subTypeId,
      ),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      TenantSearchPropertyParams(
        keyword: keyword,
        typeId: typeId,
        subTypeId: subTypeId,
      ),
    );

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.search(
        keyword: keyword,
        typeId: typeId,
        subTypeId: subTypeId,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
