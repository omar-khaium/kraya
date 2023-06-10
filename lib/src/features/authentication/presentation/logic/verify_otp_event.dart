part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyOtp extends VerifyOtpEvent {
  final String verificationId;
  final String code;
  const VerifyOtp({
    required this.verificationId,
    required this.code,
  });
}
