import '../../domain/entity/generate_otp.dart';

class GenerateOtpModel extends GenerateOtpEntity {
  GenerateOtpModel({
    required String verificationId,
    int? resendToken,
  }) : super(
          verificationId: verificationId,
          resendToken: resendToken,
        );
}
