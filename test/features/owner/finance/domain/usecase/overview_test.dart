import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/owner/finance/domain/repository/finance.mocks.dart';
import 'package:kraya_backend/features/owner/finance/domain/usecase/overview.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late FinanceOverviewUsecase usecase;
  late MockFinanceRepository mockRepository;

  setUp(() {
    mockRepository = MockFinanceRepository();
    usecase = FinanceOverviewUsecase(mockRepository);
  });

  final result = 0;

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
