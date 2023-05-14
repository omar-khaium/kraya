import 'dart:convert';

import 'package:kraya_backend/core/entity/father.dart';
import 'package:kraya_backend/core/model/father.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = FatherModel(
    name: "",
  );

  test("shoulb be a subclass of FatherEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<FatherEntity>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("father.json")));

    // act
    final tResult = FatherModel.fromJson(jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
