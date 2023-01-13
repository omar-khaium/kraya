import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/owner/payment/domain/repository/payment.mocks.dart';
import 'package:kraya_backend/features/owner/payment/domain/usecase/notify.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late PaymentNotifyUsecase usecase;
  late MockOwnerPaymentRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerPaymentRepository();
    usecase = PaymentNotifyUsecase(mockRepository);
  });

  final result = true;

  test("should get boolean from the repository", () async {
    // arrange
    when(
      mockRepository.notify(tenantId: 1, propertyId: 1, month: DateTime(2023, 1)),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(PaymentNotifyParam(tenantId: 1, propertyId: 1, month: DateTime(2023, 1)));

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.notify(tenantId: 1, propertyId: 1, month: DateTime(2023, 1)));
    verifyNoMoreInteractions(mockRepository);
  });
}
