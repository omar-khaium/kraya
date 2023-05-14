import 'dart:convert';

import 'package:kraya_backend/core/model/address.dart';
import 'package:kraya_backend/core/model/contact.dart';
import 'package:kraya_backend/core/model/emergency_contact.dart';
import 'package:kraya_backend/core/model/family_member.dart';
import 'package:kraya_backend/core/model/father.dart';
import 'package:kraya_backend/core/model/nid.dart';
import 'package:kraya_backend/core/model/occupation.dart';
import 'package:kraya_backend/core/model/passport.dart';
import 'package:kraya_backend/features/tenant/profile/data/model/profile.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = TenantFullProfileModel(
    profile: TenantProfileModel(
      id: 0,
      phone: "",
      email: "",
      firstName: "",
      lastName: "",
      gender: -1,
      role: -1,
      dateOfBirth: DateTime(2000),
    ),
    additional: TenantAdditionalProfileModel(
      nid: NIDModel(
        number: "",
        frontSide: "",
        backSide: null,
      ),
      passport: PassportModel(
        number: "",
        photoUrl: "",
      ),
      religion: -1,
      father: FatherModel(name: ""),
      permanentAddress: PermanentAddressModel(label: ""),
    ),
    emergencyContact: EmergencyContactModel(
      name: "",
      relation: -1,
      currentAddress: CurrentAddressModel(label: ""),
      permanentAddress: PermanentAddressModel(label: ""),
      contact: ContactModel(phone: ""),
    ),
    familyMembers: [
      FamilyMemberModel(
        name: "",
        dateOfBirth: DateTime(2000),
        relation: -1,
        occupation: OccupationModel(name: ""),
        nid: NIDModel(number: "", frontSide: "", backSide: null),
        contact: ContactModel(phone: ""),
      ),
    ],
  );

  test("shoulb be a subclass of TenantFullProfileModel", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<TenantFullProfileModel>());
  });

  test("should return valid model when user is found", () {
    // arrange
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("full_profile.json")));

    // act
    final tResult = TenantFullProfileModel.fromJson(0, jsonMap);

    // assert
    expect(tResult, tModel);
  });
}
