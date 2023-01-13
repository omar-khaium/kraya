import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/relation/data/datasource/remote_impl.dart';
import 'package:kraya_backend/features/core/relation/data/model/relation.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late RelationRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = RelationRemoteDataSourceImpl(client: mockHttpClient);
  });

  final results = [RelationModel(id: 0, type: "")];

  test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all")))
        .thenAnswer((_) async => Response(fixture("api_relation.json"), HttpStatus.ok));

    // act
    final result = await dataSource.getAllRelations();

    // assert
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all")));
    expect(result, equals(results));
  });

  test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all")))
        .thenAnswer((_) async => Response("", HttpStatus.notFound));

    // act

    // assert
    expect(() => dataSource.getAllRelations(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all")));
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all")))
        .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

    // act

    // assert
    expect(() => dataSource.getAllRelations(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/relation/get-all")));
    verifyNoMoreInteractions(mockHttpClient);
  });
}
