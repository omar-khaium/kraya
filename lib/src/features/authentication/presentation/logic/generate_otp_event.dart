part of 'generate_otp_bloc.dart';

abstract class GenerateOtpEvent extends Equatable {
  const GenerateOtpEvent();

  @override
  List<Object> get props => [];
}

class GenerateOtp extends GenerateOtpEvent {
  final String phone;
  const GenerateOtp({
    required this.phone,
  });
}

class _Error extends GenerateOtpEvent {
  final String message;
  const _Error({
    required this.message,
  });
}

class _Done extends GenerateOtpEvent {
  final String verificationId;
  final int? forceResendingToken;
  const _Done({
    required this.verificationId,
    this.forceResendingToken,
  });
}

class _AutoVerified extends GenerateOtpEvent {}
