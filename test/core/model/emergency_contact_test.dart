import 'dart:convert';

import 'package:kraya_backend/core/entity/emergency_contact.dart';
import 'package:kraya_backend/core/model/address.dart';
import 'package:kraya_backend/core/model/contact.dart';
import 'package:kraya_backend/core/model/emergency_contact.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = EmergencyContactModel(
    name: "",
    relation: -1,
    contact: ContactModel(phone: ""),
    currentAddress: CurrentAddressModel(label: ""),
    permanentAddress: PermanentAddressModel(label: ""),
  );

  test("shoulb be a subclass of EmergencyContactEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<EmergencyContactEntity>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("emergency_contact.json")));

    // act
    final tResult = EmergencyContactModel.fromJson(jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
