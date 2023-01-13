import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../model/payment.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_response.dart';
import 'remote.dart';

class PaymentRemoteDataSourceImpl extends OwnerPaymentRemoteDataSource {
  final Client client;
  final MultipartRequest notifyRequest;
  final MultipartRequest receivePaymentRequest;

  PaymentRemoteDataSourceImpl({required this.client, required this.notifyRequest, required this.receivePaymentRequest});

  @override
  Future<List<PaymentModel>> overview() async {
    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview"));

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<List<dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null) {
        return List<Map<String, dynamic>>.from(apiResponse.result ?? []).map((e) => PaymentModel.fromJson(e)).toList();
      } else {
        throw ServerException.fromHttpResponse(response);
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }

  @override
  Future<bool> notify({required int tenantId, required int propertyId, required DateTime month}) async {
    notifyRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    notifyRequest.fields.addAll(
      {
        "tenant_id": tenantId.toString(),
        "property_id": propertyId.toString(),
        "month": DateFormat("yyyy-MM").format(month),
      },
    );

    final StreamedResponse streamedResponse = await notifyRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      return apiResponse.success;
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }

  @override
  Future<bool> receivePayment(
      {required int ownerId, required int tenantId, required int propertyId, required DateTime month, required int amount}) async {
    notifyRequest.headers.addAll({"Content-Type": "multipart/form-data"});
    notifyRequest.fields.addAll(
      {
        "owner_id": ownerId.toString(),
        "tenant_id": tenantId.toString(),
        "property_id": propertyId.toString(),
        "month": DateFormat("yyyy-MM").format(month),
        "amount": amount.toString(),
      },
    );

    final StreamedResponse streamedResponse = await notifyRequest.send();

    if (streamedResponse.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await streamedResponse.stream.bytesToString());
      return apiResponse.success;
    } else {
      throw ServerException.fromStreamedResponse(streamedResponse, await streamedResponse.stream.bytesToString());
    }
  }
}
