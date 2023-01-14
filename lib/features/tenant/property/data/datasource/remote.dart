import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TenantPropertyRemoteDataSource>()])
abstract class TenantPropertyRemoteDataSource {
  Future<bool> add({
    required int tenantId,
    required int propertyId,
  });
  
  Future<List<int>> search({
    required String keyword,
    required int typeId,
    required int subTypeId,
  });
  
  Future<List<int>> getAll({
    required int tenantId,
  });
}
