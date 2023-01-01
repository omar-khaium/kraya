import 'package:equatable/equatable.dart';

class BankEntity extends Equatable {
  final int id;
  final String name;
  final String logo;

  BankEntity({required this.id, required this.name, required this.logo});

  @override
  List<Object?> get props => [id, name, logo];
}
