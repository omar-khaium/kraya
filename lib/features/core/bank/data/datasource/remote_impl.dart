import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import '../model/bank.dart';
import 'bank.dart';

class BankRemoteDataSourceImpl extends BankRemoteDataSource {
  final Client client;

  BankRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BankModel>> getAllBanks() async {
    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get"));

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<Map<String, dynamic>>.from(apiResponse.result ?? []).map((e) => BankModel.fromJson(e)).toList();
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
