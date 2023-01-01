import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/features/owner/bank_account/domain/repository/bank_account.mocks.dart';
import 'package:kraya_backend/features/owner/bank_account/domain/usecase/add.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late AddOwnerBankAccountUsecase usecase;
  late MockOwnerBankAccountRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerBankAccountRepository();
    usecase = AddOwnerBankAccountUsecase(mockRepository);
  });

  final int ownerId = 0;
  final int bankId = 0;
  final String name = "";
  final String accountNumber = "";
  final String branch = "";

  final bool result = true;

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.add(
        ownerId: ownerId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      ),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      AddOwnerBankAccountParams(
        ownerId: ownerId,
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
        ownerId: ownerId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
