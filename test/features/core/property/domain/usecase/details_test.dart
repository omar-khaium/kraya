import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/core/property/domain/entity/details.dart';
import 'package:kraya_backend/features/core/property/domain/repository/property.mocks.dart';
import 'package:kraya_backend/features/core/property/domain/usecase/details.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:kraya_backend/core/enum/enums.dart';

void main() {
  late PropertyDetailsUsecase usercase;
  late MockPropertyRepository mockRepository;

  setUp(() {
    mockRepository = MockPropertyRepository();
    usercase = PropertyDetailsUsecase(mockRepository);
  });

  final int tPropertyId = 0;

  final PropertyDetailsEntity tEntity = PropertyDetailsEntity(
    id: 0,
    ownerId: 0,
    propertyType: PropertyType.none,
    propertySubType: PropertySubType.none,
    buildingName: "",
    flatName: "",
    address: "",
    size: 0,
    room: 0,
    bathroom: 0,
    balcony: 0,
    advance: 0,
    rent: 0,
    description: "",
    pictures: [],
    features: [],
    createdAt: DateTime(2000),
  );

  test("should get profile from the repository", () async {
    // arrange
    when(mockRepository.details(id: tPropertyId)).thenAnswer((_) async => Right(tEntity));

    // act
    final tResult = await usercase(tPropertyId);

    // assert
    expect(tResult, Right(tEntity));
    verify(mockRepository.details(id: tPropertyId));
    verifyNoMoreInteractions(mockRepository);
  });
}
