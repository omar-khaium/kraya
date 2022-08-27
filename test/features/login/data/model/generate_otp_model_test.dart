import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kraya/features/login/data/model/generate_otp_model.dart';
import 'package:kraya/features/login/domain/entities/generate_otp.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const generateOtpModel = GenerateOtpModel(phone: "123");

  test("should be a subclass of GenerateOtpEntity entity", () {
    // assert
    expect(generateOtpModel, isA<GenerateOtpEntity>());
  });

  test("should be able to parse generate_otp.json with GenerateOtpModel.fromJson()", () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(FixtureReader.instance.read("generate_otp.json"));

    // act
    final result = GenerateOtpModel.fromJson(jsonMap);

    // assert
    expect(result, generateOtpModel);
  });

  test("should return valid Map<String, dynamic> after calling toJson() method", () {
    // arrange
    final result = generateOtpModel.toJson();
    final expectedMap = {"phone": "123"};

    // assert
    expect(result, expectedMap);
  });
}
