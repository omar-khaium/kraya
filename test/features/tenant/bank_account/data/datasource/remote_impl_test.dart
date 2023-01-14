import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/tenant/bank_account/data/datasource/remote_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late TenantBankAccountRemoteDataSourceImpl dataSource;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockMultipartRequest = MockMultipartRequest();
    dataSource = TenantBankAccountRemoteDataSourceImpl(multipartRequest: mockMultipartRequest);
  });

  final int tenantId = 0;
  final int bankId = 0;
  final String name = "";
  final String accountNumber = "";
  final String branch = "";

  final String result = fixture("api_tenant_add_bank_account.json");

  test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
    // arrange
    when(
      mockMultipartRequest.send(),
    ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

    // act
    await dataSource.add(
      tenantId: tenantId,
      bankId: bankId,
      name: name,
      accountNumber: accountNumber,
      branch: branch,
    );

    // assert
    verify(mockMultipartRequest.send());
  });
}
