import 'package:kraya_backend/core/model/address.dart';
import 'package:kraya_backend/core/model/emergency_contact.dart';
import 'package:kraya_backend/core/model/family_member.dart';
import 'package:kraya_backend/core/model/father.dart';
import 'package:kraya_backend/core/model/nid.dart';
import 'package:kraya_backend/core/model/passport.dart';

import '../../domain/entity/full_profile.dart';

class TenantFullProfileModel extends TenantFullProfileEntity {
  TenantFullProfileModel({
    required super.profile,
    required super.additional,
    required super.emergencyContact,
    required super.familyMembers,
  });

  factory TenantFullProfileModel.fromJson(int id, Map<String, dynamic> map) {
    return TenantFullProfileModel(
      profile: TenantProfileModel.fromJson(id, Map<String, dynamic>.from(map["profile"])),
      additional: TenantAdditionalProfileModel.fromJson(Map<String, dynamic>.from(map["additional"])),
      emergencyContact: EmergencyContactModel.fromJson(map),
      familyMembers: List<Map<String, dynamic>>.from(map["family-members"] ?? []).map((e) => FamilyMemeberModel.fromJson(e)).toList(),
    );
  }
}

class TenantProfileModel extends TenantProfileEntity {
  TenantProfileModel({
    required super.id,
    required super.phone,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.role,
    required super.dateOfBirth,
    required super.email,
  });

  factory TenantProfileModel.fromJson(int id, Map<String, dynamic> map) {
    return TenantProfileModel(
      id: id,
      phone: map["phone"] ?? "",
      firstName: map["first-name"] ?? "",
      lastName: map["last-name"] ?? "",
      email: map["email"],
      gender: map["gender"] ?? -1,
      role: map["role"] ?? -1,
      dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map["date-of-birth"] ?? 0),
    );
  }
}

class TenantAdditionalProfileModel extends TenantAdditionalProfileEntity {
  TenantAdditionalProfileModel(
      {required super.nid, required super.passport, required super.religion, required super.father, required super.permanentAddress});

  factory TenantAdditionalProfileModel.fromJson(Map<String, dynamic> map) {
    return TenantAdditionalProfileModel(
      nid: NIDModel.fromJson(map),
      passport: map["passport-number"] != null ? PassportModel.fromJson(map) : null,
      religion: map["religion"] ?? -1,
      father: FatherModel.fromJson(map),
      permanentAddress: PermanentAddressModel.fromJson(map),
    );
  }
}
