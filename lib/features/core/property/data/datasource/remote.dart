import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/network/api_response.dart';
import '../model/bills.dart';
import '../model/details.dart';

@GenerateNiceMocks([MockSpec<PropertyRemoteDataSource>()])
abstract class PropertyRemoteDataSource {
  Future<PropertyDetailsModel> details({required int id});
  Future<PropertyBillsModel> bills({required int id});
}

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  final Client client;

  PropertyRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<PropertyDetailsModel> details({required int id}) async {
    final Map<String, String> headers = {"property-id": id.toString()};

    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return PropertyDetailsModel.fromJson(id, apiResponse.result ?? {});
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }

  @override
  Future<PropertyBillsModel> bills({required int id}) async {
    final Map<String, String> headers = {"property-id": id.toString()};

    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return PropertyBillsModel.fromJson(apiResponse.result ?? {});
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
