import 'dart:convert';

import 'package:kraya_backend/features/core/bank/data/model/bank.dart';
import 'package:kraya_backend/features/core/bank/domain/entity/bank.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = BankModel(id: 0, name: "", logo: "");

  test("should a subclass of entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<BankEntity>());
  });

  test("should return a valid model", () {
    // arrange
    final Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(fixture("bank.json")));

    // act
    final tResult = BankModel.fromJson(map);

    // assert
    expect(tModel, equals(tResult));
  });
}
