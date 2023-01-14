import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/tenant/bank_account/domain/repository/bank_account.mocks.dart';
import 'package:kraya_backend/features/tenant/bank_account/domain/usecase/add.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late TenantAddBankAccountUsecase usecase;
  late MockTenantBankAccountRepository mockRepository;

  setUp(() {
    mockRepository = MockTenantBankAccountRepository();
    usecase = TenantAddBankAccountUsecase(mockRepository);
  });

  final int tenantId = 0;
  final int bankId = 0;
  final String name = "";
  final String accountNumber = "";
  final String branch = "";

  final bool result = true;

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.add(
        tenantId: tenantId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      ),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      TenantAddBankAccountParams(
        tenantId: tenantId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      ),
    );

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.add(
        tenantId: tenantId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
