import 'dart:convert';

import 'package:kraya_backend/features/owner/payment/data/model/payment.dart';
import 'package:kraya_backend/features/owner/payment/domain/entity/payment.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = PaymentModel(
    id: 0,
    propertyId: 0,
    amount: 0,
    status: -1,
    date: DateTime(2000),
  );

  test("should a subclass of entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<PaymentEntity>());
  });

  test("should return a valid model", () {
    // arrange
    final Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(fixture("payment.json")));

    // act
    final tResult = PaymentModel.fromJson(map);

    // assert
    expect(tModel, equals(tResult));
  });
}
