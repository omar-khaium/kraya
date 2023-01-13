import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import '../model/relation.dart';
import 'remote.dart';

class RelationRemoteDataSourceImpl extends RelationRemoteDataSource {
  final Client client;

  RelationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RelationModel>> getAllRelations() async {
    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all"));

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<Map<String, dynamic>>.from(apiResponse.result ?? []).map((e) => RelationModel.fromJson(e)).toList();
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
