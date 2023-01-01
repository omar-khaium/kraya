import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import '../model/feature.dart';
import 'feature.dart';

class FeatureRemoteDataSourceImpl extends FeatureRemoteDataSource {
  final Client client;

  FeatureRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FeatureModel>> getAllFeatures() async {
    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get"));

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<Map<String, dynamic>>.from(apiResponse.result ?? []).map((e) => FeatureModel.fromJson(e)).toList();
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
