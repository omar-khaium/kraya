import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/owner/payment/domain/repository/payment.mocks.dart';
import 'package:kraya_backend/features/owner/payment/domain/usecase/receive_payment.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late ReceivePaymentUsecase usecase;
  late MockOwnerPaymentRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerPaymentRepository();
    usecase = ReceivePaymentUsecase(mockRepository);
  });

  final result = true;

  test("should get boolean from the repository", () async {
    // arrange
    when(
      mockRepository.receivePayment(
        ownerId: 1,
        tenantId: 1,
        propertyId: 1,
        month: DateTime(2023, 1),
        amount: 0,
      ),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(ReceivePaymentParam(
      ownerId: 1,
      tenantId: 1,
      propertyId: 1,
      month: DateTime(2023, 1),
      amount: 0,
    ));

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.receivePayment(
        ownerId: 1,
        tenantId: 1,
        propertyId: 1,
        month: DateTime(2023, 1),
        amount: 0,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
