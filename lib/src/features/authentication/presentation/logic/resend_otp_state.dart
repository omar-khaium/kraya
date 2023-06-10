part of 'resend_otp_bloc.dart';

abstract class ResendOtpState extends Equatable {
  const ResendOtpState();

  @override
  List<Object> get props => [];
}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpError extends ResendOtpState {
  final String message;
  const ResendOtpError({
    required this.message,
  });
}

class ResendOtpDone extends ResendOtpState {
  final String verificationId;
  final int? forceResendingToken;

  const ResendOtpDone({
    required this.verificationId,
    required this.forceResendingToken,
  });
}

class ResendOtpAutoVerified extends ResendOtpState {}
