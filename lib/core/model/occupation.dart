import '../entity/occupation.dart';

class OccupationModel extends OccupationEntity {
  OccupationModel({required super.name});

  factory OccupationModel.fromJson(Map<String, dynamic> map) {
    return OccupationModel(
      name: map["occupation"] ?? "",
    );
  }
}
