import '../../domain/entity/bills.dart';

class PropertyBillsModel extends PropertyBillsEntity {
  PropertyBillsModel({
    required int total,
    required List<BillModel> bills,
  }) : super(
          total: total,
          bills: bills,
        );

  factory PropertyBillsModel.fromJson(Map<String, dynamic> map) {
    return PropertyBillsModel(
      total: map["total"],
      bills: List<Map<String, dynamic>>.from(map["bills"] ?? []).map((e) => BillModel.fromJson(e)).toList(),
    );
  }
}

class BillModel extends BillEntity {
  BillModel({required String name, required int amount}) : super(name: name, amount: amount);

  factory BillModel.fromJson(Map<String, dynamic> map) {
    return BillModel(
      name: map["name"],
      amount: map["amount"],
    );
  }
}
