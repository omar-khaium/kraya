import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/core/bank/domain/entity/bank.dart';
import 'package:kraya_backend/features/core/bank/domain/repository/bank.mocks.dart';
import 'package:kraya_backend/features/core/bank/domain/usecase/get_all.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late GetAllBanksUsecase usecase;
  late MockBankRepository mockRepository;

  setUp(() {
    mockRepository = MockBankRepository();
    usecase = GetAllBanksUsecase(mockRepository);
  });

  final result = <BankEntity>[];

  test("should get empty array from the repository", () async {
    // arrange
    when(
      mockRepository.getAllBanks(),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(NoParam());

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.getAllBanks());
    verifyNoMoreInteractions(mockRepository);
  });
}
