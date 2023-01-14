import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String phone;

  ContactEntity({
    required this.phone,
  });

  @override
  List<Object?> get props => [
        phone,
      ];
}
