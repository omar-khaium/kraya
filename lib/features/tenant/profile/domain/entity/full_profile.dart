import 'package:equatable/equatable.dart';
import 'package:kraya_backend/core/entity/address.dart';
import 'package:kraya_backend/core/entity/family_member.dart';
import 'package:kraya_backend/core/entity/passport.dart';

import '../../../../../core/entity/emergency_contact.dart';
import '../../../../../core/entity/father.dart';
import '../../../../../core/entity/nid.dart';

class TenantFullProfileEntity extends Equatable {
  final TenantProfileEntity profile;
  final TenantAdditionalProfileEntity additional;
  final EmergencyContactEntity emergencyContact;
  final List<FamilyMemberEntity> familyMembers;

  TenantFullProfileEntity({
    required this.profile,
    required this.additional,
    required this.emergencyContact,
    required this.familyMembers,
  });

  @override
  List<Object?> get props => [
        profile,
        additional,
        emergencyContact,
        familyMembers,
      ];
}

class TenantProfileEntity extends Equatable {
  final int id;
  final String phone;
  final String firstName;
  final String lastName;
  final String? email;
  final int gender;
  final int role;
  final DateTime dateOfBirth;
  final String? profilePicture;

  TenantProfileEntity({
    required this.id,
    required this.phone,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.gender,
    required this.role,
    required this.dateOfBirth,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [id, phone, firstName, lastName, email, gender, role, dateOfBirth, profilePicture];
}

class TenantAdditionalProfileEntity extends Equatable {
  final NIDEntity? nid;
  final PassportEntity? passport;
  final int religion;
  final FatherEntity father;
  final PermanentAddressEntity permanentAddress;

  TenantAdditionalProfileEntity({
    required this.nid,
    required this.passport,
    required this.religion,
    required this.father,
    required this.permanentAddress,
  });

  @override
  List<Object?> get props => [
        nid,
        passport,
        religion,
        father,
        permanentAddress,
      ];
}
