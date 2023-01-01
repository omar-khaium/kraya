import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/core/property/domain/entity/bills.dart';
import 'package:kraya_backend/features/core/property/domain/repository/property.mocks.dart';
import 'package:kraya_backend/features/core/property/domain/usecase/bills.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late PropertyBillsUsecase usercase;
  late MockPropertyRepository mockRepository;

  setUp(() {
    mockRepository = MockPropertyRepository();
    usercase = PropertyBillsUsecase(mockRepository);
  });

  final int tPropertyId = 0;

  final PropertyBillsEntity tEntity = PropertyBillsEntity(
    total: 10,
    bills: [
      BillEntity(
        name: "",
        amount: 10,
      ),
    ],
  );

  test("should get profile from the repository", () async {
    // arrange
    when(mockRepository.bills(id: tPropertyId)).thenAnswer((_) async => Right(tEntity));

    // act
    final tResult = await usercase(tPropertyId);

    // assert
    expect(tResult, Right(tEntity));
    verify(mockRepository.bills(id: tPropertyId));
    verifyNoMoreInteractions(mockRepository);
  });
}
