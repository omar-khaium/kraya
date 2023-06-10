part of 'resend_otp_bloc.dart';

abstract class ResendOtpEvent extends Equatable {
  const ResendOtpEvent();

  @override
  List<Object> get props => [];
}

class ResendOtp extends ResendOtpEvent {
  final String phone;
  final int forceResendingToken;
  const ResendOtp({
    required this.phone,
    required this.forceResendingToken,
  });
}
