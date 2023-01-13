import 'package:equatable/equatable.dart';

import '../../../../../../core/enum/enums.dart';
import '../../../../../core/entity/availabiilty_entity.dart';

class PropertyDetailsEntity extends Equatable {
  final int id;
  final int ownerId;
  final int? tenantId;
  final PropertyType propertyType;
  final PropertySubType propertySubType;
  final String buildingName;
  final String flatName;
  final String address;
  final int size;
  final int room;
  final int bathroom;
  final int balcony;
  final int advance;
  final int rent;
  final String description;
  final List<String> pictures;
  final List<int> features;
  final AvailabilityEntity? availability;
  final DateTime createdAt;

  PropertyDetailsEntity({
    required this.id,
    required this.ownerId,
    this.tenantId,
    required this.propertyType,
    required this.propertySubType,
    required this.buildingName,
    required this.flatName,
    required this.address,
    required this.size,
    required this.room,
    required this.bathroom,
    required this.balcony,
    required this.advance,
    required this.rent,
    required this.description,
    required this.pictures,
    required this.features,
    this.availability,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        ownerId,
        tenantId,
        propertyType,
        propertySubType,
        buildingName,
        flatName,
        address,
        size,
        room,
        bathroom,
        balcony,
        advance,
        rent,
        description,
        pictures,
        features,
        availability,
        createdAt,
      ];
}
