import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/network/api_response.dart';
import '../model/profile.dart';

@GenerateNiceMocks([MockSpec<ProfileRemoteDataSource>()])
abstract class ProfileRemoteDataSource {
  /// Identify if the an user exists with this [phone] number
  ///
  /// Only use to check if this [phone] holder is a new user or not.
  ///
  /// This method will return a [ProfileModel] if an user exists
  /// with same [phone] number.
  /// In case of, new or deleted user, a [UserDoesNotExists] exception
  /// will be thrown as error.
  Future<ProfileModel> identify({required String phone});

  /// Get the profile of user with this unique [id]
  ///
  /// This method will return a [ProfileModel] if an user exists
  /// with same [id].
  /// This method will always return a [ProfileModel],
  /// if the method is called for loggedIn users.
  Future<ProfileModel> view({required int id});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Client client;

  ProfileRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<ProfileModel> identify({required String phone}) async {
    final Map<String, String> headers = {"phone": phone};

    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null && (apiResponse.result?.containsKey("user") ?? false)) {
        return ProfileModel.fromJson(apiResponse.result!["user"] ?? {});
      } else {
        throw ProfileNotFoundException();
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }

  @override
  Future<ProfileModel> view({required int id}) async {
    final Map<String, String> headers = {"id": id.toString()};

    final response = await client.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(response.body);
      if (apiResponse.success && apiResponse.result != null && (apiResponse.result?.containsKey("user") ?? false)) {
        return ProfileModel.fromJson(apiResponse.result!["user"] ?? {});
      } else {
        throw ProfileNotFoundException();
      }
    } else {
      throw ServerException.fromHttpResponse(response);
    }
  }
}
