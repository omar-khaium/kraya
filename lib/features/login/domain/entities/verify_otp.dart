import 'package:equatable/equatable.dart';

class VerifyOtpEntity extends Equatable {
  final String phone;
  final String code;
  final bool matched;

  const VerifyOtpEntity({required this.phone, required this.code, required this.matched});

  @override
  List<Object?> get props => [phone, code, matched];
}
