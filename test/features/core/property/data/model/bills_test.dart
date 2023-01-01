import 'dart:convert';

import 'package:kraya_backend/features/core/property/data/model/bills.dart';
import 'package:kraya_backend/features/core/property/domain/entity/bills.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = PropertyBillsModel(
    total: 10,
    bills: [
      BillModel(
        name: "",
        amount: 10,
      ),
    ],
  );

  test("shoulb be a subclass of PropertyBillsEntity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<PropertyBillsEntity>());
  });

  group("fromJson", () {
    test("should return valid model when user is found", () {
      // arrange
      final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(json.decode(fixture("property_bills.json")));

      // act
      final tResult = PropertyBillsModel.fromJson(jsonMap);

      // assert
      expect(tResult, tModel);
    });
  });
}
