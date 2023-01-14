import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';
import 'package:kraya_backend/features/owner/appointment/data/datasource/remote_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late OwnerAppointmentRemoteDataSourceImpl dataSource;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockMultipartRequest = MockMultipartRequest();
    dataSource = OwnerAppointmentRemoteDataSourceImpl(multipartRequest: mockMultipartRequest);
  });

  final int ownerId = 0;
  final String name = "";
  final String phone = "";
  final String secondPhone = "";
  final String address = "";
  final double latitude = 0.0;
  final double longitude = 0.0;
  final DateTime date = DateTime(2000);

  final String result = fixture("api_owner_add_appointment.json");

  test("""should perform a call with [POST] request in [HttpClient] 
    and get created user guid as valid response""", () async {
    // arrange
    when(
      mockMultipartRequest.send(),
    ).thenAnswer((_) async => StreamedResponse(ByteStream.fromBytes(utf8.encode(result)), HttpStatus.ok));

    // act
    await dataSource.add(
      ownerId: ownerId,
      name: name,
      phone: phone,
      secondPhone: secondPhone,
      address: address,
      latitude: latitude,
      longitude: longitude,
      date: date,
    );

    // assert
    verify(mockMultipartRequest.send());
  });
}
