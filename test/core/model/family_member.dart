// import 'package:kraya_backend/core/model/contact.dart';
// import 'package:kraya_backend/core/model/nid.dart';
// import 'package:kraya_backend/core/model/occupation.dart';

// import '../entity/family_member.dart';

// class FamilyMemeberModel extends FamilyMemeberEntity {
//   FamilyMemeberModel({
//     required super.name,
//     required super.dateOfBirth,
//     required super.relation,
//     required super.occupation,
//     required super.nid,
//     required super.contact,
//   });

//   factory FamilyMemeberModel.fromJson(Map<String, dynamic> map) {
//     return FamilyMemeberModel(
//       name: map["name"] ?? "",
//       dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map["date-of-birth"] ?? 0),
//       relation: map["relation"] ?? -1,
//       occupation: OccupationModel.fromJson(map),
//       nid: NIDModel.fromJson(map),
//       contact: ContactModel.fromJson(map),
//     );
//   }
// }
