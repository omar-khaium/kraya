import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/tenant/property/data/datasource/remote_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late TenantPropertyRemoteDataSourceImpl dataSource;
  late MockClient mockClient;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockClient = MockClient();
    mockMultipartRequest = MockMultipartRequest();
    dataSource = TenantPropertyRemoteDataSourceImpl(
      multipartRequest: mockMultipartRequest,
      client: mockClient,
    );
  });

  group("add", () {
    final int tenantId = 0;
    final int propertyId = 0;

    final String result = fixture("api_tenant_add_property.json");

    test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
      // arrange
      when(
        mockMultipartRequest.send(),
      ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

      // act
      await dataSource.add(
        tenantId: tenantId,
        propertyId: propertyId,
      );

      // assert
      verify(mockMultipartRequest.send());
    });
  });

  group("search", () {
    final String keyword = "";
    final int typeId = 0;
    final int subTypeId = 0;

    final List<int> results = [1];

    final headers = {
      "keyword": keyword,
      "property-type": typeId.toString(),
      "property-sub-type": subTypeId.toString(),
    };

    test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
      // arrange
      when(
        mockClient.get(
          Uri.parse("https://kraya.succour.ltd/api/v1/tenant/property/search"),
          headers: headers,
        ),
      ).thenAnswer((_) async => Response(fixture("api_tenant_search_property.json"), HttpStatus.ok));

      // act
      final tResult = await dataSource.search(keyword: keyword, typeId: typeId, subTypeId: subTypeId);

      // assert
      expect(tResult, results);
      verify(
        mockClient.get(
          Uri.parse("https://kraya.succour.ltd/api/v1/tenant/property/search"),
          headers: headers,
        ),
      );
    });
  });

  group("all properties", () {
    final int tenantId = 0;

    final List<int> results = [1];

    final headers = {
      "tenant-id": tenantId.toString(),
    };

    test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
      // arrange
      when(
        mockClient.get(
          Uri.parse("https://kraya.succour.ltd/api/v1/tenant/property/all-properties"),
          headers: headers,
        ),
      ).thenAnswer((_) async => Response(fixture("api_tenant_search_property.json"), HttpStatus.ok));

      // act
      final tResult = await dataSource.getAll(tenantId: tenantId);

      // assert
      expect(tResult, results);
      verify(
        mockClient.get(
          Uri.parse("https://kraya.succour.ltd/api/v1/tenant/property/all-properties"),
          headers: headers,
        ),
      );
    });
  });
}
