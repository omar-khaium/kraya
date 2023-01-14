import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/entity/availabiilty.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../core/property/domain/entity/bills.dart';
import '../repository/property.dart';

class AddOwnerPropertyUsecase extends Usecase<bool, AddOwnerPropertyParams> {
  final OwnerPropertyRepository _repository;

  AddOwnerPropertyUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.add(
      ownerId: param.ownerId,
      tenantId: param.tenantId,
      typeIdId: param.typeId,
      subTypeId: param.subTypeId,
      buildingName: param.buildingName,
      flatName: param.flatName,
      address: param.address,
      size: param.size,
      room: param.room,
      bathroom: param.bathroom,
      balcony: param.balcony,
      advance: param.advance,
      rent: param.rent,
      description: param.description,
      features: param.features,
      bills: param.bills,
      availabilityEntity: param.availabilityEntity,
      pictures: param.pictures,
    );
  }
}

class AddOwnerPropertyParams {
  final int ownerId;
  final int? tenantId;
  final int typeId;
  final int subTypeId;
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
  final List<int> features;
  final List<BillEntity> bills;
  final AvailabilityEntity? availabilityEntity;
  final List<File> pictures;

  AddOwnerPropertyParams({
    required this.ownerId,
    required this.tenantId,
    required this.typeId,
    required this.subTypeId,
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
    required this.features,
    required this.bills,
    required this.availabilityEntity,
    required this.pictures,
  });
}
