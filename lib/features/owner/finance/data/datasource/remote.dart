import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<OwnerFinanceRemoteDataSource>()])
abstract class OwnerFinanceRemoteDataSource {
  Future<int> overview({required int ownerId, required DateTime from, required DateTime to});
}
