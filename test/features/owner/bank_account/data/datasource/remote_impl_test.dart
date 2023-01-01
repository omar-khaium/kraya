import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/features/core/registration/data/datasource/remote_impl.mocks.dart';
import 'package:kraya_backend/features/owner/bank_account/data/datasource/remote_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late OwnerBankAccountRemoteDataSourceImpl dataSource;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockMultipartRequest = MockMultipartRequest();
    dataSource = OwnerBankAccountRemoteDataSourceImpl(multipartRequest: mockMultipartRequest);
  });

  final int ownerId = 0;
  final int bankId = 0;
  final String name = "";
  final String accountNumber = "";
  final String branch = "";

  final String result = fixture("api_add_owner_bank_account.json");

  test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
    // arrange
    when(
      mockMultipartRequest.send(),
    ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

    // act
    await dataSource.add(
      ownerId: ownerId,
      bankId: bankId,
      name: name,
      accountNumber: accountNumber,
      branch: branch,
    );

    // assert
    verify(mockMultipartRequest.send());
  });
}
