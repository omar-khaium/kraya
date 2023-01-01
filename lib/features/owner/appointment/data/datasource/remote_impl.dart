import 'dart:io';

import 'package:http/http.dart';
import '../../../../../core/enum/parser.dart';
import '../../../../../core/error/exceptions.dart';
import 'package:mockito/annotations.dart';
import '../../../../../core/enum/enums.dart';

import 'remote.dart';

import '../../../../../core/network/api_response.dart';

@GenerateNiceMocks([MockSpec<MultipartRequest>()])
class OwnerBankAccountRemoteDataSourceImpl extends OwnerAppointmentRemoteDataSource {
  final MultipartRequest multipartRequest;

  OwnerBankAccountRemoteDataSourceImpl({required this.multipartRequest});
  
  @override
  Future<bool> add({required int ownerId, required String name, required String phone, required String? secondPhone, required String address, required double latitude, required double longitude, required DateTime date}) async {
    multipartRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    multipartRequest.fields.addAll(
      {
        "owner_id": ownerId.toString(),
        "name": name,
        "phone": phone,
        "second_phone": secondPhone ?? "",
        "address": address,
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
        "date": date.millisecondsSinceEpoch.toString(),
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
