part of 'generate_otp_bloc.dart';

abstract class GenerateOtpState extends Equatable {
  const GenerateOtpState();

  @override
  List<Object> get props => [];
}

class GenerateOtpInitial extends GenerateOtpState {}

class GenerateOtpLoading extends GenerateOtpState {}

class GenerateOtpError extends GenerateOtpState {
  final String message;
  const GenerateOtpError({
    required this.message,
  });
}

class GenerateOtpDone extends GenerateOtpState {
  final String verificationId;
  final int? forceResendingToken;

  const GenerateOtpDone({
    required this.verificationId,
    required this.forceResendingToken,
  });
}

class GenerateOtpAutoVerified extends GenerateOtpState {}
