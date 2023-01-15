import 'dart:convert';

import 'package:kraya_backend/core/entity/availabiilty.dart';
import 'package:kraya_backend/core/model/availability.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = AvailabilityModel(
    available: true,
    from: DateTime(2000),
  );

  test("shoulb be a subclass of AvailabilityEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<AvailabilityEntity>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("availability.json")));

    // act
    final tResult = AvailabilityModel.fromJson(jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
