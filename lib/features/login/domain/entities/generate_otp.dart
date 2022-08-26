import 'package:equatable/equatable.dart';

class GenerateOtp extends Equatable {
  final String phone;

  const GenerateOtp(this.phone);

  @override
  List<Object?> get props => [phone];
}
