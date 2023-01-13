import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/payment/data/datasource/remote_impl.dart';
import 'package:kraya_backend/features/owner/payment/data/model/payment.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late PaymentRemoteDataSourceImpl dataSource;

  late MockClient mockHttpClient;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockHttpClient = MockClient();
    mockMultipartRequest = MockMultipartRequest();
    dataSource = PaymentRemoteDataSourceImpl(
      client: mockHttpClient,
      notifyRequest: mockMultipartRequest,
      receivePaymentRequest: mockMultipartRequest,
    );
  });

  final results = [
    PaymentModel(
      id: 0,
      propertyId: 0,
      amount: 0,
      status: PaymentStatus.none,
      date: DateTime(2000),
    )
  ];

  group("overview", () {
    test("should perform a call with [GET] request in [HttpClient] with valid response", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview")))
          .thenAnswer((_) async => Response(fixture("api_owner_payment_overview.json"), HttpStatus.ok));

      // act
      final result = await dataSource.overview();

      // assert
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview")));
      expect(result, equals(results));
    });

    test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview")))
          .thenAnswer((_) async => Response("", HttpStatus.notFound));

      // act

      // assert
      expect(() => dataSource.overview(), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview")));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview")))
          .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

      // act

      // assert
      expect(() => dataSource.overview(), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/owner/payment/overview")));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });

  group("notify", () {
    final String result = fixture("api_owner_payment_notify.json");

    final tenantId = 1;
    final propertyId = 1;
    final month = DateTime.now();

    test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
      // arrange
      when(
        mockMultipartRequest.send(),
      ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

      // act
      await dataSource.notify(tenantId: tenantId, propertyId: propertyId, month: month);

      // assert
      verify(mockMultipartRequest.send());
    });
  });

  group("receive payment", () {
    final String result = fixture("api_owner_receive_payment.json");

    final ownerId = 1;
    final tenantId = 1;
    final propertyId = 1;
    final month = DateTime.now();
    final amount = 0;

    test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
      // arrange
      when(
        mockMultipartRequest.send(),
      ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

      // act
      await dataSource.receivePayment(
        ownerId: ownerId,
        tenantId: tenantId,
        propertyId: propertyId,
        month: month,
        amount: amount,
      );

      // assert
      verify(mockMultipartRequest.send());
    });
  });
}
