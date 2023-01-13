import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/error/exceptions.dart';

import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/core/bank/data/datasource/remote_impl.dart';
import 'package:kraya_backend/features/core/bank/data/model/bank.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late BankRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = BankRemoteDataSourceImpl(client: mockHttpClient);
  });

  final results = [BankModel(id: 0, name: "", logo: "")];

  test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get")))
        .thenAnswer((_) async => Response(fixture("api_bank.json"), HttpStatus.ok));

    // act
    final result = await dataSource.getAllBanks();

    // assert
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get")));
    expect(result, equals(results));
  });

  test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get")))
        .thenAnswer((_) async => Response("", HttpStatus.notFound));

    // act

    // assert
    expect(() => dataSource.getAllBanks(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get")));
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get")))
        .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

    // act

    // assert
    expect(() => dataSource.getAllBanks(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/banks/get")));
    verifyNoMoreInteractions(mockHttpClient);
  });
}
