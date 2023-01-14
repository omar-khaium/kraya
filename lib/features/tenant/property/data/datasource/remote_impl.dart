import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import 'remote.dart';

class TenantPropertyRemoteDataSourceImpl extends TenantPropertyRemoteDataSource {
  final Client client;
  final MultipartRequest multipartRequest;

  TenantPropertyRemoteDataSourceImpl({required this.client, required this.multipartRequest});

  @override
  Future<bool> add({
    required int tenantId,
    required int propertyId,
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "tenant_id": tenantId.toString(),
        "property_id": propertyId.toString(),
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

  @override
  Future<List<int>> search({required String keyword, required int typeId, required int subTypeId}) async {
    final Map<String, String> headers = {
      "keyword": keyword,
      "property-type": typeId.toString(),
      "property-sub-type": subTypeId.toString(),
    };

    final response = await client.get(
      Uri.parse("https://kraya.succour.ltd/api/v1/tenant/property/search"),
      headers: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<int>.from(apiResponse.result ?? []);
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }

  @override
  Future<List<int>> getAll({
    required int tenantId,
  }) async {
    final Map<String, String> headers = {
      "tenant-id": tenantId.toString(),
    };

    final response = await client.get(
      Uri.parse("https://kraya.succour.ltd/api/v1/tenant/property/all-properties"),
      headers: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<int>.from(apiResponse.result ?? []);
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
