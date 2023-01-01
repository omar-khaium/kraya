import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/core/relation/domain/entity/relation.dart';
import 'package:kraya_backend/features/core/relation/domain/repository/relation.mocks.dart';
import 'package:kraya_backend/features/core/relation/domain/usecase/get_all.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late GetAllRelationsUsecase usecase;
  late MockRelationRepository mockRepository;

  setUp(() {
    mockRepository = MockRelationRepository();
    usecase = GetAllRelationsUsecase(mockRepository);
  });

  final result = <RelationEntity>[];

  test("should get empty array from the repository", () async {
    // arrange
    when(
      mockRepository.getAllRelations(),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(NoParam());

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.getAllRelations());
    verifyNoMoreInteractions(mockRepository);
  });
}
