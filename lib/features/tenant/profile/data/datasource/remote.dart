import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';

import '../../../../../../core/network/api_response.dart';
import '../../../../../core/error/exceptions.dart';
import '../model/profile.dart';

@GenerateNiceMocks([MockSpec<TenantProfileRemoteDataSource>()])
abstract class TenantProfileRemoteDataSource {
  Future<bool> update({
    required int tenantId,
    required String nidNumber,
    required String passportNumnber,
    required String email,
    required int religion,
    required String fatherName,
    required String address,
    required String occupation,
    required String jobAddress,
    required File? nidPhoto,
  });

  Future<TenantFullProfileModel> view({required int id});
}

class TenantProfileRemoteDataSourceImpl implements TenantProfileRemoteDataSource {
  final Client client;
  final MultipartRequest multipartRequest;

  TenantProfileRemoteDataSourceImpl({
    required this.client,
    required this.multipartRequest,
  });

  @override
  Future<TenantFullProfileModel> view({required int id}) async {
    final Map<String, String> headers = {"id": id.toString()};

    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null && (apiResponse.result?.containsKey("user") ?? false)) {
        return TenantFullProfileModel.fromJson(id, apiResponse.result ?? {});
      } else {
        throw ProfileNotFoundException();
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }

  @override
  Future<bool> update({
    required int tenantId,
    required String nidNumber,
    required String passportNumnber,
    required String email,
    required int religion,
    required String fatherName,
    required String address,
    required String occupation,
    required String jobAddress,
    required File? nidPhoto,
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "tenant_id": tenantId.toString(),
        "nid_number": nidNumber,
        "passport_number": passportNumnber,
        "email": email,
        "religion": religion.toString(),
        "father_name": fatherName,
        "permanent_address": address,
        "occupation": occupation,
        "job_address": jobAddress,
      },
    );

    if (nidPhoto != null) {
      multipartRequest.files.add(await MultipartFile.fromPath("nid_photo", nidPhoto.path));
    }

    final StreamedResponse streamedResponse = await multipartRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      return apiResponse.success;
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }
}
