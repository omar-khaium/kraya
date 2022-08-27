import 'package:flutter_test/flutter_test.dart';
import 'package:kraya/features/login/data/model/generate_otp_model.dart';
import 'package:kraya/features/login/domain/entities/generate_otp.dart';

void main() {
  const generateOtpModel = GenerateOtpModel(phone: "123");

  test("should be a subclass of GenerateOtpEntity entity", () {
    // assert
    expect(generateOtpModel, isA<GenerateOtpEntity>());
  });
}
