import '../entity/contact.dart';

class ContactModel extends ContactEntity {
  ContactModel({required super.phone});

  factory ContactModel.fromJson(Map<String, dynamic> map) {
    return ContactModel(
      phone: map["contact-number"] ?? "",
    );
  }
}
