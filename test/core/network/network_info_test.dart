import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:kraya_backend/core/network/network_info.dart';
import 'package:kraya_backend/core/network/network_info.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    networkInfoImpl = NetworkInfoImpl(internetConnectionChecker: mockNetworkInfo, addresses: mockNetworkInfo.addresses);
  });

  group("is online", () {
    test("network info shuould have connection", () async {
      // arrange
      when(mockNetworkInfo.hasConnection).thenAnswer((_) async => true);

      // act
      final result = await networkInfoImpl.online;

      // assert
      verify(mockNetworkInfo.hasConnection);
      expect(result, true);
    });
  });

  group("is offline", () {
    test("network info souldn't have connection", () async {
      // arrange
      when(mockNetworkInfo.hasConnection).thenAnswer((_) async => false);

      // act
      final result = await networkInfoImpl.online;

      // assert
      verify(mockNetworkInfo.hasConnection);
      expect(result, false);
    });
  });
}
