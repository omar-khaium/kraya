import 'dart:convert';

import 'package:kraya_backend/core/entity/address.dart';
import 'package:kraya_backend/core/model/address.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group("address", () {
    final tModel = AddressModel(label: "");

    test("shoulb be a subclass of AddressEntity", () {
      // arrange

      // act

      // assert
      expect(tModel, isA<AddressEntity>());
    });

    test("should return valid model when user is found", () {
      // arrange
      final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("address.json")));

      // act
      final tResult = AddressModel.fromJson(jsonMap);

      // assert
      expect(tResult, tModel);
    });
  });

  group("current address", () {
    final tModel = CurrentAddressModel(label: "");

    test("shoulb be a subclass of AddressEntity", () {
      // arrange

      // act

      // assert
      expect(tModel, isA<AddressEntity>());
      expect(tModel, isA<CurrentAddressEntity>());
    });

    test("should return valid model when user is found", () {
      // arrange
      final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("current_address.json")));

      // act
      final tResult = CurrentAddressModel.fromJson(jsonMap);

      // assert
      expect(tResult, tModel);
    });
  });
  group("permanent address", () {
    final tModel = PermanentAddressModel(label: "");

    test("shoulb be a subclass of AddressEntity", () {
      // arrange

      // act

      // assert
      expect(tModel, isA<AddressEntity>());
      expect(tModel, isA<PermanentAddressEntity>());
    });

    test("should return valid model when user is found", () {
      // arrange
      final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("permanent_address.json")));

      // act
      final tResult = PermanentAddressModel.fromJson(jsonMap);

      // assert
      expect(tResult, tModel);
    });
  });
}
