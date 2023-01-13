import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/core/feature/domain/entity/feature.dart';
import 'package:kraya_backend/features/core/feature/domain/repository/feature.mocks.dart';
import 'package:kraya_backend/features/core/feature/domain/usecase/get_all.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late GetAllFeaturesUsecase usecase;
  late MockFeatureRepository mockRepository;

  setUp(() {
    mockRepository = MockFeatureRepository();
    usecase = GetAllFeaturesUsecase(mockRepository);
  });

  final result = <FeatureEntity>[];

  test("should get empty array from the repository", () async {
    // arrange
    when(
      mockRepository.getAllFeatures(),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(NoParam());

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.getAllFeatures());
    verifyNoMoreInteractions(mockRepository);
  });
}
