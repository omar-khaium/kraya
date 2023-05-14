import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/network/api_response.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test("should throw an exception [ServerException] with empty string", () {
    // arrange

    // act

    // assert
    expect(() => ApiResponse.fromJson(""), throwsA(isA<ServerException>()));
  });
  test("should throw an exception [ServerException] with empty json", () {
    // arrange

    // act

    // assert
    expect(() => ApiResponse.fromJson("{}"), throwsA(isA<ServerException>()));
  });
}
