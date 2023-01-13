import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/features/core/registration/data/datasource/remote_impl.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late RegistrationRemoteDataSourceImpl dataSource;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockMultipartRequest = MockMultipartRequest();
    dataSource = RegistrationRemoteDataSourceImpl(multipartRequest: mockMultipartRequest);
  });

  final String firstName = "";
  final String lastName = "";
  final String phone = "";
  final String email = "";
  final DateTime dateOfBirth = DateTime(2000);
  final Gender gender = Gender.none;
  final Role role = Role.none;
  final File? profilePicture = null;

  final String result = fixture("api_registration.json");

  test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
    // arrange
    when(
      mockMultipartRequest.send(),
    ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

    // act
    await dataSource.submit(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      dateOfBirth: dateOfBirth,
      gender: gender,
      role: role,
      profilePicture: profilePicture,
    );

    // assert
    verify(mockMultipartRequest.send());
  });
}
