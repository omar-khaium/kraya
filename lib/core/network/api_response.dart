import 'dart:convert';

import '../error/exceptions.dart';

class ApiResponse<T> {
  final bool success;
  final String? error;
  final T? result;

  ApiResponse({required this.success, required this.error, required this.result});

  factory ApiResponse.fromJson(String jsonData) {
    if (jsonData.isEmpty) {
      throw ServerException("Invalid response, server response can't be empty");
    } else {
      final Map<String, dynamic> response = Map<String, dynamic>.from(json.decode(jsonData));
      if (response.containsKey("success") && response.containsKey("error") && response.containsKey("result")) {
        return ApiResponse<T>(
          success: response["success"] ?? false,
          error: response["error"],
          result: response["result"] as T?,
        );
      } else {
        throw ServerException("Server response is not correctly formatted, please provide a valid response");
      }
    }
  }
}
