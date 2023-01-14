import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import 'remote.dart';

class TenantBankAccountRemoteDataSourceImpl extends TenantBankAccountRemoteDataSource {
  final MultipartRequest multipartRequest;

  TenantBankAccountRemoteDataSourceImpl({required this.multipartRequest});
  @override
  Future<bool> add({
    required int tenantId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "tenant_id": tenantId.toString(),
        "bank_id": bankId.toString(),
        "name": name,
        "number": accountNumber,
        "branch": branch,
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
