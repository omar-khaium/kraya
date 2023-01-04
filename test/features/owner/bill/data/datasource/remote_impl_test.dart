import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/features/core/registration/data/datasource/remote_impl.mocks.dart';
import 'package:kraya_backend/features/owner/bill/data/datasource/remote_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late OwnerBillRemoteDataSourceImpl dataSource;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockMultipartRequest = MockMultipartRequest();
    dataSource = OwnerBillRemoteDataSourceImpl(multipartRequest: mockMultipartRequest);
  });

  final int ownerId = 0;
  final int propertyId = 0;
  final String name = "";
  final int amount = 0;
  final int extra = 0;

  final String result = fixture("api_add_owner_bill.json");

  test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
    // arrange
    when(
      mockMultipartRequest.send(),
    ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

    // act
    await dataSource.add(
      ownerId: ownerId,
      propertyId: propertyId,
      name: name,
      amount: amount,
      extra: extra,
    );

    // assert
    verify(mockMultipartRequest.send());
  });
}
