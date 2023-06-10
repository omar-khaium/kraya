part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpError extends VerifyOtpState {
  final String message;
  const VerifyOtpError({
    required this.message,
  });
}

class VerifyOtpDone extends VerifyOtpState {}
