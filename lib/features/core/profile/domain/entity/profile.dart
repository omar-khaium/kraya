import 'package:equatable/equatable.dart';

import '../../../../../../core/enum/enums.dart';

class ProfileEntity extends Equatable {
  final int id;
  final String phone;
  final String firstName;
  final String lastName;
  final String? email;
  final Gender gender;
  final Role role;
  final DateTime dateOfBirth;
  final String? profilePicture;

  ProfileEntity({
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
