import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<FinanceRemoteDataSource>()])
abstract class FinanceRemoteDataSource {
  Future<int> overview();
}
