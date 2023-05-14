import 'dart:convert';

import 'package:kraya_backend/core/entity/family_member.dart';
import 'package:kraya_backend/core/model/contact.dart';
import 'package:kraya_backend/core/model/family_member.dart';
import 'package:kraya_backend/core/model/nid.dart';
import 'package:kraya_backend/core/model/occupation.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = FamilyMemberModel(
    name: "",
    dateOfBirth: DateTime(2000),
    relation: -1,
    occupation: OccupationModel(name: ""),
    nid: NIDModel(number: "", frontSide: "", backSide: null),
    contact: ContactModel(phone: ""),
  );

  test("shoulb be a subclass of FamilyMemberEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<FamilyMemberEntity>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("family_member.json")));

    // act
    final tResult = FamilyMemberModel.fromJson(jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
