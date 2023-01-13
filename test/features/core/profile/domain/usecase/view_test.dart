import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/features/core/profile/domain/entity/profile.dart';
import 'package:kraya_backend/features/core/profile/domain/repository/profile.mocks.dart';
import 'package:kraya_backend/features/core/profile/domain/usecase/view.dart';

void main() {
  late ViewUsecase usecase;
  late MockProfileRepository mockRepositoy;

  setUp(() {
    mockRepositoy = MockProfileRepository();
    usecase = ViewUsecase(mockRepositoy);
  });

  test("should return a entity from the repository", () async {
    // arrange
    final int tId = 0;
    final ProfileEntity tEntity = ProfileEntity(
      id: 0,
      phone: "",
      firstName: "",
      lastName: "",
      gender: Gender.none,
      role: Role.none,
      dateOfBirth: DateTime(2000),
    );
    when(mockRepositoy.view(id: tId)).thenAnswer((_) async => Right(tEntity));

    // act
    final tResult = await usecase(tId);

    // assert
    expect(tResult, Right(tEntity));
    verify(mockRepositoy.view(id: tId));
    verifyNoMoreInteractions(mockRepositoy);
  });
}
