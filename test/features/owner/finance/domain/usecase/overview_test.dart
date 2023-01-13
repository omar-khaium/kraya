import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/owner/finance/domain/repository/finance.mocks.dart';
import 'package:kraya_backend/features/owner/finance/domain/usecase/overview.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late OwnerFinanceOverviewUsecase usecase;
  late MockOwnerFinanceRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerFinanceRepository();
    usecase = OwnerFinanceOverviewUsecase(mockRepository);
  });

  final result = 0;
  final int ownerId = 0;
  final DateTime from = DateTime(2000);
  final DateTime to = DateTime(2001);

  test("should get empty array from the repository", () async {
    // arrange
    when(
      mockRepository.overview(ownerId: ownerId, from: from, to: to),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(OwnerFinanceOverviewParam(ownerId: ownerId, from: from, to: to));

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.overview(ownerId: ownerId, from: from, to: to));
    verifyNoMoreInteractions(mockRepository);
  });
}
