import '../../../../../core/entity/availabiilty.dart';
import '../../../../../core/model/availability.dart';
import '../../domain/entity/details.dart';

class PropertyDetailsModel extends PropertyDetailsEntity {
  PropertyDetailsModel({
    required int id,
    required int ownerId,
    int? tenantId,
    required int propertyType,
    required int propertySubType,
    required String buildingName,
    required String flatName,
    required String address,
    required int size,
    required int room,
    required int bathroom,
    required int balcony,
    required int advance,
    required int rent,
    required String description,
    required List<String> pictures,
    required List<int> features,
    AvailabilityEntity? availability,
    required DateTime createdAt,
  }) : super(
          id: id,
          ownerId: ownerId,
          tenantId: tenantId,
          propertyType: propertyType,
          propertySubType: propertySubType,
          buildingName: buildingName,
          flatName: flatName,
          address: address,
          size: size,
          room: room,
          bathroom: bathroom,
          balcony: balcony,
          advance: advance,
          rent: rent,
          description: description,
          pictures: pictures,
          features: features,
          availability: availability,
          createdAt: createdAt,
        );

  factory PropertyDetailsModel.fromJson(int id, Map<String, dynamic> map) {
    return PropertyDetailsModel(
      id: id,
      ownerId: map["owner-id"],
      tenantId: map["tenant-id"],
      propertyType: map["type"] ?? -1,
      propertySubType: map["sub-type"] ?? -1,
      buildingName: map["building-name"],
      flatName: map["flat-name"],
      address: map["address"],
      size: map["size"],
      room: map["room"],
      bathroom: map["room"],
      balcony: map["balcony"],
      advance: map["advance"],
      rent: map["rent"],
      description: map["description"],
      availability: map["availability"] != null ? AvailabilityModel.fromJson(map["availability"]) : null,
      pictures: List<String>.from(map["pictures"] ?? []),
      features: List<int>.from(map["features"] ?? []),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map["created-at"]),
    );
  }
}
