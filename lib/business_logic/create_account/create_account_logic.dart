import '../../model/create_account.dart';

abstract class CreateAccount{
  Future<bool> createAccount(CreateAccountModel createAccount);
}