// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final int extraCharge;

  BillEntity({this.extraCharge = 0, required this.name, required this.amount});

  @override
  List<Object?> get props => [name, amount, extraCharge];

  

  BillEntity copyWith({
    String? name,
    int? amount,
    int? extraCharge,
  }) {
    return BillEntity(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      extraCharge: extraCharge ?? this.extraCharge,
    );
  }
}
