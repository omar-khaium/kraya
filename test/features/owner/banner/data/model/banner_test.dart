import 'dart:convert';

import 'package:kraya_backend/features/owner/promotion/data/model/banner.dart';
import 'package:kraya_backend/features/owner/promotion/domain/entity/banner.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = BannerModel(
    url: "",
    action: "",
    expiresAt: DateTime(2000),
  );

  test("should a subclass of entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<BannerEntity>());
  });

  test("should return a valid model", () {
    // arrange
    final Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(fixture("banner.json")));

    // act
    final tResult = BannerModel.fromJson(map);

    // assert
    expect(tModel, equals(tResult));
  });
}
