import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<OwnerBillRemoteDataSource>()])
abstract class OwnerBillRemoteDataSource {
  Future<bool> add({
    required int ownerId,
    required int propertyId,
    required String name,
    required int amount,
    required int extra,
  });
}
