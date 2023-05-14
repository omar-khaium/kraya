import 'dart:convert';

import 'package:kraya_backend/core/entity/contact.dart';
import 'package:kraya_backend/core/model/contact.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = ContactModel(
    phone: "",
  );

  test("shoulb be a subclass of ContactEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<ContactEntity>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("contact.json")));

    // act
    final tResult = ContactModel.fromJson(jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
