import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<LoginRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<FirebaseAuth>()])
abstract class LoginRemoteDataSource {
  Future<ConfirmationResult> generateOtp({required String phone});
  Future<ConfirmationResult> resendOtp({required String phone});

  Future<bool> verify({required ConfirmationResult confirmationResult, required String code});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  LoginRemoteDataSourceImpl({required this.firebaseAuth});
  @override
  Future<ConfirmationResult> generateOtp({required String phone}) {
    return firebaseAuth.signInWithPhoneNumber(phone);
  }

  @override
  Future<ConfirmationResult> resendOtp({required String phone}) {
    return firebaseAuth.signInWithPhoneNumber(phone);
  }

  @override
  Future<bool> verify({required ConfirmationResult confirmationResult, required String code}) async {
    return (await confirmationResult.confirm(code)).user!=null;
  }
}
