import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/owner/bill/domain/repository/bill.mocks.dart';
import 'package:kraya_backend/features/owner/bill/domain/usecase/add.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late AddOwnerBillUsecase usecase;
  late MockOwnerBillRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerBillRepository();
    usecase = AddOwnerBillUsecase(mockRepository);
  });

  final int ownerId = 0;
  final int propertyId = 0;
  final String name = "";
  final int amount = 0;
  final int extra = 0;

  final bool result = true;

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.add(
        ownerId: ownerId,
        propertyId: propertyId,
        name: name,
        amount: amount,
        extra: extra,
      ),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      AddOwnerBillParams(
        ownerId: ownerId,
        propertyId: propertyId,
        name: name,
        amount: amount,
        extra: extra,
      ),
    );

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.add(
        ownerId: ownerId,
        propertyId: propertyId,
        name: name,
        amount: amount,
        extra: extra,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
