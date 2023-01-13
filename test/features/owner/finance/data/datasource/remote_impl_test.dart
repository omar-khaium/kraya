import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/owner/finance/data/datasource/remote_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late FinanceRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = FinanceRemoteDataSourceImpl(client: mockHttpClient);
  });

  final results = 0;

  test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview")))
        .thenAnswer((_) async => Response(fixture("api_finance.json"), HttpStatus.ok));

    // act
    final result = await dataSource.overview();

    // assert
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview")));
    expect(result, equals(results));
  });

  test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview")))
        .thenAnswer((_) async => Response("", HttpStatus.notFound));

    // act

    // assert
    expect(() => dataSource.overview(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview")));
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview")))
        .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

    // act

    // assert
    expect(() => dataSource.overview(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/finance/overview")));
    verifyNoMoreInteractions(mockHttpClient);
  });
}
