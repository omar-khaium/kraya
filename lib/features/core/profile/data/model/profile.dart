import '../../../../../core/error/exceptions.dart';
import '../../domain/entity/profile.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required int id,
    required String phone,
    required String firstName,
    required String lastName,
    String? email,
    required int gender,
    required int role,
    required DateTime dateOfBirth,
    String? profilePicture,
  }) : super(
          id: id,
          phone: phone,
          firstName: firstName,
          lastName: lastName,
          email: email,
          gender: gender,
          role: role,
          dateOfBirth: dateOfBirth,
          profilePicture: profilePicture,
        );

  factory ProfileModel.fromJson(Map<String, dynamic>? map) {
    if (map != null && map.isNotEmpty) {
      return ProfileModel(
        id: map["id"] ?? 0,
        phone: map["phone"] ?? "",
        firstName: map["first-name"] ?? "",
        lastName: map["last-name"] ?? "",
        email: map["email"].toString().isEmpty ? null : map["email"],
        gender: map["gender"] ?? -1,
        role: map["role"] ?? -1,
        dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map["date-of-birth"] ?? 0),
        profilePicture: map["profile-picture"].toString().isEmpty ? null : map["profile-picture"],
      );
    } else {
      throw ProfileNotFoundException();
    }
  }
}
