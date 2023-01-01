import 'dart:convert';

import 'package:kraya_backend/features/core/relation/data/model/relation.dart';
import 'package:kraya_backend/features/core/relation/domain/entity/relation.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = RelationModel(id: 0, type: "");

  test("should a subclass of entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<RelationEntity>());
  });

  test("should return a valid model", () {
    // arrange
    final Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(fixture("relation.json")));

    // act
    final tResult = RelationModel.fromJson(map);

    // assert
    expect(tModel, equals(tResult));
  });
}
