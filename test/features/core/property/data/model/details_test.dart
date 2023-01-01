import 'dart:convert';

import 'package:kraya_backend/features/core/property/data/model/details.dart';
import 'package:kraya_backend/features/core/property/domain/entity/details.dart';
import 'package:test/test.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = PropertyDetailsModel(
    id: 0,
    ownerId: 0,
    tenantId: 0,
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
    availability: AvailabilityModel(available: true, from: DateTime(2000)),
    pictures: [],
    features: [],
    createdAt: DateTime(2000),
  );

  test("shoulb be a subclass of PropertyDetailsEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<PropertyDetailsEntity>());
  });

  group("fromJson", () {
    test("should return valid model when user is found", () {
      // arrange
      final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("property_details.json")));

      // act
      final tResult = PropertyDetailsModel.fromJson(0, jsonMap);

      // assert
      expect(tResult, tModel);
    });
  });
}
