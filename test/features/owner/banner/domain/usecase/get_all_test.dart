import 'package:dartz/dartz.dart';
import 'package:kraya_backend/core/usecase/no_param.dart';
import 'package:kraya_backend/features/owner/promotion/domain/entity/banner.dart';
import 'package:kraya_backend/features/owner/promotion/domain/repository/banner.mocks.dart';
import 'package:kraya_backend/features/owner/promotion/domain/usecase/get_all.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late GetAllOwnerBannerUsecase usecase;
  late MockOwnerBannerPromotionRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerBannerPromotionRepository();
    usecase = GetAllOwnerBannerUsecase(mockRepository);
  });

  final result = <BannerEntity>[];

  test("should get empty array from the repository", () async {
    // arrange
    when(
      mockRepository.getAll(),
    ).thenAnswer(
      (_) async => Right(result),
    );

    // act
    final tResult = await usecase(NoParam());

    // assert
    expect(tResult, Right(result));
    verify(mockRepository.getAll());
    verifyNoMoreInteractions(mockRepository);
  });
}
