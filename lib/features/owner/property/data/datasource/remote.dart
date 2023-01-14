import 'dart:io';

import 'package:mockito/annotations.dart';

import '../../../../../core/entity/availabiilty.dart';
import '../../../../core/property/domain/entity/bills.dart';

@GenerateNiceMocks([MockSpec<OwnerPropertyRemoteDataSource>()])
abstract class OwnerPropertyRemoteDataSource {
  Future<bool> add({
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
    required AvailabilityEntity? availabilityModel,
    required List<File> pictures,
  });

  Future<bool> edit({
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
    required AvailabilityEntity? availabilityModel,
    required List<String> oldPictures,
    required List<File> newPictures,
  });

  Future<bool> sendBill({
    required int propertyId,
    required int tenantId,
  });
  Future<List<int>> allProperties({required int ownerId});
}
