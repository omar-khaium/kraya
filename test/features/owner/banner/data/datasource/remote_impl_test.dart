import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/features/core/property/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/core/registration/data/datasource/remote_impl.mocks.dart';
import 'package:kraya_backend/features/owner/promotion/data/datasource/remote_impl.dart';
import 'package:kraya_backend/features/owner/promotion/data/model/banner.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late OwnerBannerPromotionRemoteDataSourceImpl dataSource;

  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = OwnerBannerPromotionRemoteDataSourceImpl(client: mockHttpClient);
  });

  final results = [
    BannerModel(
      url: "",
      action: "",
      expiresAt: DateTime(2000),
    )
  ];

  test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get")))
        .thenAnswer((_) async => Response(fixture("api_owner_banner_promotion_get_all.json"), HttpStatus.ok));

    // act
    final result = await dataSource.getAll();

    // assert
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get")));
    expect(result, equals(results));
  });

  test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get")))
        .thenAnswer((_) async => Response("", HttpStatus.notFound));

    // act

    // assert
    expect(() => dataSource.getAll(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get")));
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
    // arrange
    when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get")))
        .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

    // act

    // assert
    expect(() => dataSource.getAll(), throwsA(isA<ServerException>()));
    verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/promotion/banner/get")));
    verifyNoMoreInteractions(mockHttpClient);
  });
}
