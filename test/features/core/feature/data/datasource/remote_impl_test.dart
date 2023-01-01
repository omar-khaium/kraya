import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/features/core/feature/data/datasource/remote_impl.dart';
import 'package:kraya_backend/features/core/feature/data/model/feature.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/remote.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late FeatureRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = FeatureRemoteDataSourceImpl(client: mockHttpClient);
  });

  final results = [FeatureModel(id: 0, name: "")];

  test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get")))
        .thenAnswer((_) async => Response(fixture("api_feature.json"), HttpStatus.ok));

    // act
    final result = await dataSource.getAllFeatures();

    // assert
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get")));
    expect(result, equals(results));
  });

  test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get")))
        .thenAnswer((_) async => Response("", HttpStatus.notFound));

    // act

    // assert
    expect(() => dataSource.getAllFeatures(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get")));
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get")))
        .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

    // act

    // assert
    expect(() => dataSource.getAllFeatures(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/features/get")));
    verifyNoMoreInteractions(mockHttpClient);
  });
}
