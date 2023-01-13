import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/owner/payment/domain/entity/payment.dart';
import 'package:kraya_backend/features/owner/payment/domain/repository/payment.mocks.dart';
import 'package:kraya_backend/features/owner/payment/domain/usecase/overview.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late PaymentOverviewUsecase usecase;
  late MockOwnerPaymentRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerPaymentRepository();
    usecase = PaymentOverviewUsecase(mockRepository);
  });

  final result = <PaymentEntity>[];

  test("should get empty array from the repository", () async {
    // arrange
    when(
      mockRepository.overview(),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(NoParam());

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.overview());
    verifyNoMoreInteractions(mockRepository);
  });
}
