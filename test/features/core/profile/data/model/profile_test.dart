import 'dart:convert';

import 'package:test/test.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/features/core/profile/data/model/profile.dart';
import 'package:kraya_backend/features/core/profile/domain/entity/profile.dart';
import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = ProfileModel(
    id: 1,
    phone: "",
    firstName: "",
    lastName: "",
    gender: Gender.none,
    role: Role.none,
    dateOfBirth: DateTime(1970, 1, 1, 6, 0),
  );

  test("shoulb be a subclass of ProfileEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<ProfileEntity>());
  });

  group("fromJson", () {
    test("should return valid model when user is found", () {
      // arrange
      final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("profile.json")));

      // act
      final tResult = ProfileModel.fromJson(jsonMap);

      // assert
      expect(tResult, tModel);
    });
    test("should throw [ProfileNotFoundException] when user is not found and input is empty json", () {
      // arrange

      // act

      // assert
      expect(() => ProfileModel.fromJson({}), throwsA(isA<ProfileNotFoundException>()));
    });
    test("should throw [ProfileNotFoundException] when user is not found and input is null", () {
      // arrange

      // act

      // assert
      expect(() => ProfileModel.fromJson(null), throwsA(isA<ProfileNotFoundException>()));
    });
  });
}
