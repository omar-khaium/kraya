import 'dart:io';

import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import '../model/banner.dart';
import 'remote.dart';

class OwnerBannerPromotionRemoteDataSourceImpl extends OwnerBannerPromotionRemoteDataSource {
  final Client client;

  OwnerBannerPromotionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BannerModel>> getAll() async {
    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get"));

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<Map<String, dynamic>>.from(apiResponse.result ?? []).map((e) => BannerModel.fromJson(e)).toList();
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
