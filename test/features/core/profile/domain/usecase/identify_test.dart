import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/features/core/profile/domain/entity/profile.dart';
import 'package:kraya_backend/features/core/profile/domain/repository/profile.mocks.dart';
import 'package:kraya_backend/features/core/profile/domain/usecase/identify.dart';

void main() {
  late IdentifyUsecase usercase;
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
    usercase = IdentifyUsecase(mockRepository);
  });

  final String tPhone = "01647376463";
  final ProfileEntity tEntity = ProfileEntity(
    id: 0,
    phone: "",
    firstName: "",
    lastName: "",
    gender: Gender.none,
    role: Role.none,
    dateOfBirth: DateTime(2000),
  );

  test("should get profile from the repository", () async {
    // arrange
    when(mockRepository.identify(phone: tPhone)).thenAnswer((_) async => Right(tEntity));

    // act
    final tResult = await usercase(tPhone);

    // assert
    expect(tResult, Right(tEntity));
    verify(mockRepository.identify(phone: tPhone));
    verifyNoMoreInteractions(mockRepository);
  });
}
