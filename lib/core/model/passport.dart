import 'package:kraya_backend/core/entity/passport.dart';

class PassportModel extends PassportEntity {
  PassportModel({required super.number, required super.photoUrl});
  factory PassportModel.fromJson(Map<String, dynamic> map) {
    return PassportModel(
      number: map["passport-number"],
      photoUrl: map["passport-photo"],
    );
  }
}
