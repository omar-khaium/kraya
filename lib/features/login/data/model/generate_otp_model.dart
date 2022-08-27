import 'package:kraya/features/login/domain/entities/generate_otp.dart';

class GenerateOtpModel extends GenerateOtpEntity {
  const GenerateOtpModel({required String phone}) : super(phone: phone);

  factory GenerateOtpModel.fromJson(Map<String, dynamic> json) => GenerateOtpModel(phone: json["phone"]);

  Map<String, dynamic> toJson() => {"phone": phone};
}
