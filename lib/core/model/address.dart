import '../entity/address.dart';

class AddressModel extends AddressEntity {
  AddressModel({required super.label});

  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      label: map["address"] ?? "",
    );
  }
}

class PermanentAddressModel extends PermanentAddressEntity {
  PermanentAddressModel({required super.label});
  factory PermanentAddressModel.fromJson(Map<String, dynamic> map) {
    return PermanentAddressModel(
      label: map["address"] ?? "",
    );
  }
}

class CurrentAddressModel extends CurrentAddressEntity {
  CurrentAddressModel({required super.label});

  factory CurrentAddressModel.fromJson(Map<String, dynamic> map) {
    return CurrentAddressModel(
      label: map["address"] ?? "",
    );
  }
}
