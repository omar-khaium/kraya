import 'package:equatable/equatable.dart';

class GenerateOtpEntity extends Equatable {
  final String verificationId;
  final int? resendToken;

  GenerateOtpEntity({
    required this.verificationId,
    this.resendToken,
  });

  @override
  List<Object?> get props => [verificationId, resendToken];
}
