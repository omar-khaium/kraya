import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import 'remote.dart';

class RegistrationRemoteDataSourceImpl extends RegistrationRemoteDataSource {
  final MultipartRequest multipartRequest;

  RegistrationRemoteDataSourceImpl({required this.multipartRequest});
  @override
  Future<String> submit({
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
    required DateTime dateOfBirth,
    required int gender,
    required int role,
    File? profilePicture,
  }) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "date_of_birth": dateOfBirth.millisecondsSinceEpoch.toString(),
        "gender": gender.toString(),
        "role": role.toString(),
      },
    );
    if (email != null) {
      multipartRequest.fields.addAll({"email": email});
    }
    if (profilePicture != null) {
      multipartRequest.files.add(await MultipartFile.fromPath("profilePicture", profilePicture.path));
    }

    final StreamedResponse streamedResponse = await multipartRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      if (apiResponse.success && apiResponse.result != null && (apiResponse.result?.containsKey("user-id") ?? false)) {
        return apiResponse.result?["user-id"];
      } else {
        throw ServerException("Registration failed");
      }
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }
}
