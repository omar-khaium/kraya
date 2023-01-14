import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/entity/availabiilty.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../features/core/property/domain/entity/bills.dart';
import '../../domain/repository/property.dart';
import '../datasource/remote.dart';

class OwnerPropertyRepositoryImpl extends OwnerPropertyRepository {
  final OwnerPropertyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerPropertyRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
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
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.add(
        ownerId: ownerId,
        tenantId: tenantId,
        typeId: typeIdId,
        subTypeId: subTypeId,
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
        features: features,
        bills: bills,
        availabilityModel: availabilityEntity,
        pictures: pictures,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> sendBill({required int tenantId, required int propertyId}) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.sendBill(
        propertyId: propertyId,
        tenantId: tenantId,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
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
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.edit(
        propertyId: propertyId,
        ownerId: ownerId,
        tenantId: tenantId,
        typeId: typeId,
        subTypeId: subTypeId,
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
        features: features,
        bills: bills,
        availabilityModel: availabilityEntity,
        oldPictures: oldPictures,
        newPictures: newPictures,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<int>>> allProperties({required int ownerId}) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.allProperties(ownerId: ownerId);
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
