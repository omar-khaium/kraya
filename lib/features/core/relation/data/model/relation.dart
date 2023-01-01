import '../../domain/entity/relation.dart';

class RelationModel extends RelationEntity {
  RelationModel({required int id, required String type}) : super(id: id, type: type);

  factory RelationModel.fromJson(Map<String, dynamic> map) {
    return RelationModel(
      id: map["id"],
      type: map["name"],
    );
  }
}
