import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/entity/availabiilty_entity.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../core/property/domain/entity/bills.dart';
import 'remote.dart';

@GenerateNiceMocks([MockSpec<MultipartRequest>()])
class OwnerPropertyRemoteDataSourceImpl extends OwnerPropertyRemoteDataSource {
  final MultipartRequest multipartRequest;

  OwnerPropertyRemoteDataSourceImpl({required this.multipartRequest});
  @override
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
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});

    multipartRequest.fields.addAll(
      {
        //! user_id should be owner_id
        "user_id": ownerId.toString(),
        "tenant": tenantId.toString(),
        "type": typeId.toString(),
        "sub_type": subTypeId.toString(),
        "building_name": buildingName,
        "flat_name": flatName,
        "address": address,
        "size": size.toString(),
        "room": room.toString(),
        "bathroom": bathroom.toString(),
        "balcony": balcony.toString(),
        "advance": advance.toString(),
        "rent": rent.toString(),
        "description": description,
        "availability[available]": availabilityModel?.available.toString() ?? "",
        "availability[from]": availabilityModel?.from.toString() ?? "",
      },
    );

    for (int index = 0; index < features.length; index++) {
      multipartRequest.fields.addAll({
        "features[$index]": features.elementAt(index).toString(),
      });
    }

    for (int index = 0; index < bills.length; index++) {
      multipartRequest.fields.addAll({
        "bills[$index][name]": bills.elementAt(index).name,
        "bills[$index][amount]": bills.elementAt(index).amount.toString(),
        "bills[$index][extra_charge]": bills.elementAt(index).extraCharge.toString(),
      });
    }

    for (int index = 0; index < pictures.length; index++) {
      multipartRequest.files.add(await MultipartFile.fromPath("picture[$index]", pictures.elementAt(index).path));
    }

    final StreamedResponse streamedResponse = await multipartRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      return apiResponse.success;
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }

  @override
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
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "property_id": propertyId.toString(),
        //! user_id should be owner_id
        "user_id": ownerId.toString(),
        "tenant": tenantId.toString(),
        "type": typeId.toString(),
        "sub_type": subTypeId.toString(),
        "building_name": buildingName,
        "flat_name": flatName,
        "address": address,
        "size": size.toString(),
        "room": room.toString(),
        "bathroom": bathroom.toString(),
        "balcony": balcony.toString(),
        "advance": advance.toString(),
        "rent": rent.toString(),
        "description": description,
        //todo: need to add old picture list
        "old_pictures": oldPictures.join(","),
        "availability[available]": availabilityModel?.available.toString() ?? "",
        "availability[from]": availabilityModel?.from.toString() ?? "",
      },
    );

    for (int index = 0; index < features.length; index++) {
      multipartRequest.fields.addAll({
        "features[$index]": features.elementAt(index).toString(),
      });
    }

    for (int index = 0; index < bills.length; index++) {
      multipartRequest.fields.addAll({
        "bills[$index][name]": bills.elementAt(index).name,
        "bills[$index][amount]": bills.elementAt(index).amount.toString(),
        "bills[$index][extra_charge]": bills.elementAt(index).extraCharge.toString(),
      });
    }

    for (int index = 0; index < newPictures.length; index++) {
      multipartRequest.files.add(await MultipartFile.fromPath("picture[$index]", newPictures.elementAt(index).path));
    }

    final StreamedResponse streamedResponse = await multipartRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      return apiResponse.success;
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }

  @override
  Future<bool> sendBill({required int propertyId, required int tenantId}) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "property_id": propertyId.toString(),
        "user_id": tenantId.toString(),
      },
    );

    final StreamedResponse streamedResponse = await multipartRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      return apiResponse.success;
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }
}
