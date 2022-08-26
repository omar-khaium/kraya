import 'package:equatable/equatable.dart';

class GenerateOtpEntity extends Equatable {
  final String phone;

  const GenerateOtpEntity({required this.phone});

  @override
  List<Object?> get props => [phone];
}
