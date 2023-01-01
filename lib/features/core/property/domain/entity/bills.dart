import 'package:equatable/equatable.dart';

class PropertyBillsEntity extends Equatable {
  final int total;
  final List<BillEntity> bills;

  PropertyBillsEntity({required this.total, required this.bills});

  @override
  List<Object?> get props => [total, bills];
}

class BillEntity extends Equatable {
  final String name;
  final int amount;

  BillEntity({required this.name, required this.amount});

  @override
  List<Object?> get props => [name, amount];
}
