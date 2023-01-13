import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/entity/availabiilty_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../features/core/property/domain/entity/bills.dart';

@GenerateNiceMocks([MockSpec<OwnerPropertyRepository>()])
abstract class OwnerPropertyRepository {
  Future<Either<Failure, bool>> add({
    required int ownerId,
    required int? tenantId,
    required int typeIdId,
    required int subTypeId,
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
    required List<int> features,
    required List<BillEntity> bills,
    required AvailabilityEntity? availabilityEntity,
    required List<File> pictures,
  });

  Future<Either<Failure, bool>> edit({
    required int propertyId,
    required int ownerId,
    required int? tenantId,
    required int typeId,
    required int subTypeId,
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
    required List<int> features,
    required List<BillEntity> bills,
    required AvailabilityEntity? availabilityEntity,
    required List<String> oldPictures,
    required List<File> newPictures,
  });

  Future<Either<Failure, bool>> sendBill({
    required int tenantId,
    required int propertyId,
  });

  // Future<Either<Failure, PropertyEntity>> allProperties({
  //   required int ownerId,
  // });
}
