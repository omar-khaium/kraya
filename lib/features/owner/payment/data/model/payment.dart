import '../../domain/entity/payment.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel({
    required super.id,
    required super.propertyId,
    required super.amount,
    required super.status,
    required super.date,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> map) {
    return PaymentModel(
      id: map["bill-id"] ?? 0,
      propertyId: map["property-id"] ?? 0,
      amount: map["amount"] ?? 0,
      status: map["status"] ?? -1,
      date: DateTime.fromMillisecondsSinceEpoch(map["payment-date"] ?? 0),
    );
  }
}
