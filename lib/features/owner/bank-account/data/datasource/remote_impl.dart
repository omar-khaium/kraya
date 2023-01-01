import 'dart:io';

import 'package:http/http.dart';
import '../../../../../core/enum/parser.dart';
import '../../../../../core/error/exceptions.dart';
import 'package:mockito/annotations.dart';
import '../../../../../core/enum/enums.dart';

import 'remote.dart';

import '../../../../../core/network/api_response.dart';

@GenerateNiceMocks([MockSpec<MultipartRequest>()])
class RegistrationRemoteDataSourceImpl extends OwnerBankAccountRemoteDataSource {
  final MultipartRequest multipartRequest;

  RegistrationRemoteDataSourceImpl({required this.multipartRequest});
  @override
  Future<bool> submit({
    required int ownerId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "owner_id": ownerId.toString(),
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
