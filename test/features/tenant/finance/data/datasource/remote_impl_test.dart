import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/tenant/finance/data/datasource/remote_impl.dart';
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

  final int tenantId = 0;
  final DateTime from = DateTime(2000);
  final DateTime to = DateTime(2001);

  test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
    // arrange
    when(
      mockHttpClient.get(
        Uri.parse("https://kraya.succour.ltd/api/v1/tenant/finance/overview"),
        headers: {
          'tenant-id': tenantId.toString(),
          'from': from.millisecondsSinceEpoch.toString(),
          'to': to.millisecondsSinceEpoch.toString(),
        },
      ),
    ).thenAnswer((_) async => Response(fixture("api_finance.json"), HttpStatus.ok));

    // act
    final result = await dataSource.overview(tenantId: tenantId, from: from, to: to);

    // assert
    verify(
      mockHttpClient.get(
        Uri.parse("https://kraya.succour.ltd/api/v1/tenant/finance/overview"),
        headers: {
          'tenant-id': tenantId.toString(),
          'from': from.millisecondsSinceEpoch.toString(),
          'to': to.millisecondsSinceEpoch.toString(),
        },
      ),
    );
    expect(result, equals(results));
  });

  test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
    // arrange
    when(
      mockHttpClient.get(
        Uri.parse("https://kraya.succour.ltd/api/v1/tenant/finance/overview"),
        headers: {
          'tenant-id': tenantId.toString(),
          'from': from.millisecondsSinceEpoch.toString(),
          'to': to.millisecondsSinceEpoch.toString(),
        },
      ),
    ).thenAnswer((_) async => Response("", HttpStatus.notFound));

    // act

    // assert
    expect(() => dataSource.overview(tenantId: tenantId, from: from, to: to), throwsA(isA<ServerException>()));
    verify(
      mockHttpClient.get(
        Uri.parse("https://kraya.succour.ltd/api/v1/tenant/finance/overview"),
        headers: {
          'tenant-id': tenantId.toString(),
          'from': from.millisecondsSinceEpoch.toString(),
          'to': to.millisecondsSinceEpoch.toString(),
        },
      ),
    );
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
    // arrange
    when(
      mockHttpClient.get(
        Uri.parse("https://kraya.succour.ltd/api/v1/tenant/finance/overview"),
        headers: {
          'tenant-id': tenantId.toString(),
          'from': from.millisecondsSinceEpoch.toString(),
          'to': to.millisecondsSinceEpoch.toString(),
        },
      ),
    ).thenAnswer((_) async => Response("", HttpStatus.internalServerError));

    // act

    // assert
    expect(() => dataSource.overview(tenantId: tenantId, from: from, to: to), throwsA(isA<ServerException>()));
    verify(
      mockHttpClient.get(
        Uri.parse("https://kraya.succour.ltd/api/v1/tenant/finance/overview"),
        headers: {
          'tenant-id': tenantId.toString(),
          'from': from.millisecondsSinceEpoch.toString(),
          'to': to.millisecondsSinceEpoch.toString(),
        },
      ),
    );
    verifyNoMoreInteractions(mockHttpClient);
  });
}
