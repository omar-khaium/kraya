import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/model/availability_model.dart';
import 'package:kraya_backend/features/core/property/data/datasource/remote.dart';
import 'package:kraya_backend/features/core/property/data/model/bills.dart';
import 'package:kraya_backend/features/core/property/data/model/details.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/exceptions.dart';

import 'package:kraya_backend/core/network/network_info.mocks.dart';
import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late PropertyRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = PropertyRemoteDataSourceImpl(client: mockHttpClient);
  });

  final tPropertyId = 0;

  group("details", () {
    final tModel = PropertyDetailsModel(
      id: tPropertyId,
      ownerId: 0,
      tenantId: 0,
      propertyType: PropertyType.none,
      propertySubType: PropertySubType.none,
      buildingName: "",
      flatName: "",
      address: "",
      size: 0,
      room: 0,
      bathroom: 0,
      balcony: 0,
      advance: 0,
      rent: 0,
      description: "",
      availability: AvailabilityModel(available: true, from: DateTime(2000)),
      pictures: [],
      features: [],
      createdAt: DateTime(2000),
    );

    test("""should perform a call with [GET] request in [HttpClient] 
    with phone number in header only with valid response""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response(fixture("api_property_details.json"), HttpStatus.ok));

      // act
      final result = await dataSource.details(id: tPropertyId);

      // assert
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}));
      expect(result, equals(tModel));
    });

    test("""should throw a [ProfileNotFoundException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response(fixture("api_property_details_not_found.json"), HttpStatus.ok));

      // act

      // assert
      expect(() => dataSource.details(id: tPropertyId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response("", HttpStatus.notFound));

      // act

      // assert
      expect(() => dataSource.details(id: tPropertyId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

      // act

      // assert
      expect(() => dataSource.details(id: tPropertyId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/details"), headers: {"property-id": "0"}));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });

  group("bills", () {
    final tModel = PropertyBillsModel(
      total: 10,
      bills: [
        BillModel(
          name: "",
          amount: 10,
        ),
      ],
    );

    test("""should perform a call with [GET] request in [HttpClient] 
    with phone number in header only with valid response""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response(fixture("api_property_bills.json"), HttpStatus.ok));

      // act
      final result = await dataSource.bills(id: tPropertyId);

      // assert
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}));
      expect(result, equals(tModel));
    });

    test("""should throw a [ProfileNotFoundException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response(fixture("api_property_bills_not_found.json"), HttpStatus.ok));

      // act

      // assert
      expect(() => dataSource.bills(id: tPropertyId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response("", HttpStatus.notFound));

      // act

      // assert
      expect(() => dataSource.bills(id: tPropertyId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}))
          .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

      // act

      // assert
      expect(() => dataSource.bills(id: tPropertyId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/property/bills"), headers: {"property-id": "0"}));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
