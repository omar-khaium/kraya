import 'package:equatable/equatable.dart';

import '../../../../../core/enum/enums.dart';

class PaymentEntity extends Equatable {
  final int id;
  final int propertyId;
  final PaymentStatus status;
  final int amount;
  final DateTime? date;

  PaymentEntity({
    required this.propertyId,
    required this.status,
    required this.date,
    required this.id,
    required this.amount,
  });

  @override
  List<Object?> get props => [id, propertyId, status, date, amount];
}