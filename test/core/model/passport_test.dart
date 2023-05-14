import 'dart:convert';

import 'package:kraya_backend/core/entity/passport.dart';
import 'package:kraya_backend/core/model/passport.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = PassportModel(
    number: "",
    photoUrl: "",
  );

  test("shoulb be a subclass of PassportEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<PassportEntity>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("passport.json")));

    // act
    final tResult = PassportModel.fromJson(jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
