import '../../domain/entity/bank.dart';

class BankModel extends BankEntity {
  BankModel({required int id, required String name, required String logo}) : super(id: id, name: name, logo: logo);

  factory BankModel.fromJson(Map<String, dynamic> map) {
    return BankModel(
      id: map["id"],
      name: map["name"],
      logo: map["logo"],
    );
  }
}
