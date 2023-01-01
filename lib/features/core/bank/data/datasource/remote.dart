import 'package:mockito/annotations.dart';
import '../model/bank.dart';

@GenerateNiceMocks([MockSpec<BankRemoteDataSource>()])
abstract class BankRemoteDataSource {
  Future<List<BankModel>> getAllBanks();
}
