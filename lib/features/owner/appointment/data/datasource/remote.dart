import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<OwnerAppointmentRemoteDataSource>()])
abstract class OwnerAppointmentRemoteDataSource {
  Future<bool> add({
    required int ownerId,
    required String name,
    required String phone,
    required String? secondPhone,
    required String address,
    required double latitude,
    required double longitude,
    required DateTime date,
  });
}
