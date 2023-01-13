import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import 'remote.dart';

class FinanceRemoteDataSourceImpl extends OwnerFinanceRemoteDataSource {
  final Client client;

  FinanceRemoteDataSourceImpl({required this.client});

  @override
  Future<int> overview({required int ownerId, required DateTime from, required DateTime to}) async {
    final Map<String, String> headers = {
      "owner-id": ownerId.toString(),
      "from": from.millisecondsSinceEpoch.toString(),
      "to": to.millisecondsSinceEpoch.toString(),
    };
    final response = await client.get(
      Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview"),
      headers: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<String> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return int.tryParse(apiResponse.result ?? "") ?? 0;
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
