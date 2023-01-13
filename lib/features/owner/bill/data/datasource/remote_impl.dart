import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import 'remote.dart';

@GenerateNiceMocks([MockSpec<MultipartRequest>()])
class OwnerBillRemoteDataSourceImpl extends OwnerBillRemoteDataSource {
  final MultipartRequest multipartRequest;

  OwnerBillRemoteDataSourceImpl({required this.multipartRequest});
  @override
  Future<bool> add({
    required int ownerId,
    required int propertyId,
    required String name,
    required int amount,
    required int extra,
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "owner_id": ownerId.toString(),
        "property_id": propertyId.toString(),
        "name": name,
        "amount": amount.toString(),
        "extra": extra.toString(),
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
