import 'dart:convert';

import 'package:kraya_backend/features/core/feature/data/model/feature.dart';
import 'package:kraya_backend/features/core/feature/domain/entity/feature.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = FeatureModel(id: 0, name: "");

  test("should a subclass of entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<FeatureEntity>());
  });

  test("should return a valid model", () {
    // arrange
    final Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(fixture("feature.json")));

    // act
    final tResult = FeatureModel.fromJson(map);

    // assert
    expect(tModel, equals(tResult));
  });
}
