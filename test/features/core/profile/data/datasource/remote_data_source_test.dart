import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'package:kraya_backend/core/enum/enums.dart';
import 'package:kraya_backend/core/error/exceptions.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/remote.dart';
import 'package:kraya_backend/features/core/profile/data/datasource/remote.mocks.dart';
import 'package:kraya_backend/features/core/profile/data/model/profile.dart';
import '../../../../../fixtures/fixture_reader.dart';

void main() {
  late ProfileRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProfileRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("identify", () {
    final tPhone = "";
    final tModel = ProfileModel(
      id: 1,
      phone: "",
      firstName: "",
      lastName: "",
      gender: Gender.none,
      role: Role.none,
      dateOfBirth: DateTime(1970, 1, 1, 6, 0),
    );
    test("""should perform a call with [GET] request in [HttpClient] 
    with phone number in header only with valid response""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}))
          .thenAnswer((_) async => Response(fixture("api_profile.json"), HttpStatus.ok));

      // act
      final result = await dataSource.identify(phone: tPhone);

      // assert
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}));
      expect(result, equals(tModel));
    });

    test("""should throw a [ProfileNotFoundException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}))
          .thenAnswer((_) async => Response(fixture("api_profile_not_found.json"), HttpStatus.ok));

      // act

      // assert
      expect(() => dataSource.identify(phone: tPhone), throwsA(isA<ProfileNotFoundException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}))
          .thenAnswer((_) async => Response("", HttpStatus.notFound));

      // act

      // assert
      expect(() => dataSource.identify(phone: tPhone), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}))
          .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

      // act

      // assert
      expect(() => dataSource.identify(phone: tPhone), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"phone": tPhone}));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
  group("view", () {
    final tId = 1;
    final tModel = ProfileModel(
      id: 1,
      phone: "",
      firstName: "",
      lastName: "",
      gender: Gender.none,
      role: Role.none,
      dateOfBirth: DateTime(1970, 1, 1, 6, 0),
    );
    test("""should perform a call with [GET] request in [HttpClient] 
    with phone number in header only with valid response""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}))
          .thenAnswer((_) async => Response(fixture("api_profile.json"), HttpStatus.ok));

      // act
      final result = await dataSource.view(id: tId);

      // assert
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}));
      expect(result, equals(tModel));
    });

    test("""should throw a [ProfileNotFoundException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}))
          .thenAnswer((_) async => Response(fixture("api_profile_not_found.json"), HttpStatus.ok));

      // act

      // assert
      expect(() => dataSource.view(id: tId), throwsA(isA<ProfileNotFoundException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing a call with [GET] request
     in [HttpClient] with phone number in header only and url is wrong""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}))
          .thenAnswer((_) async => Response("", HttpStatus.notFound));

      // act

      // assert
      expect(() => dataSource.view(id: tId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test("""should throw a [ServerException] when performing 
    a call with [GET] request in [HttpClient] with phone number in header only while server is down""", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}))
          .thenAnswer((_) async => Response("", HttpStatus.internalServerError));

      // act

      // assert
      expect(() => dataSource.view(id: tId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(Uri.parse("https://kraya.succour.ltd/api/v1/core/profile"), headers: {"id": tId.toString()}));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
