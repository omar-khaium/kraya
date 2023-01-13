import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/tenant/finance/domain/repository/finance.mocks.dart';
import 'package:kraya_backend/features/tenant/finance/domain/usecase/overview.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantFinanceOverviewUsecase usecase;
  late MockTenantFinanceRepository mockRepository;

  setUp(() {
    mockRepository = MockTenantFinanceRepository();
    usecase = TenantFinanceOverviewUsecase(mockRepository);
  });

  final result = 0;
  final int tenantId = 0;
  final DateTime from = DateTime(2000);
  final DateTime to = DateTime(2001);

  test("should get zero from the repository", () async {
    // arrange
    when(
      mockRepository.overview(tenantId: tenantId, from: from, to: to),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(TenantFinanceOverviewParam(tenantId: tenantId, from: from, to: to));

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.overview(tenantId: tenantId, from: from, to: to));
    verifyNoMoreInteractions(mockRepository);
  });
}
