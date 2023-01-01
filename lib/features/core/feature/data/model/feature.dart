import '../../domain/entity/feature.dart';

class FeatureModel extends FeatureEntity {
  FeatureModel({required int id, required String name}) : super(id: id, name: name);

  factory FeatureModel.fromJson(Map<String, dynamic> map) {
    return FeatureModel(
      id: map["id"],
      name: map["name"],
    );
  }
}
