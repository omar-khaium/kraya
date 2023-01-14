import 'package:equatable/equatable.dart';


class ProfileEntity extends Equatable {
  final int id;
  final String phone;
  final String firstName;
  final String lastName;
  final String? email;
  final int gender;
  final int role;
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
