import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraya/features/login/domain/entities/verify_otp.dart';
import 'package:kraya/features/login/domain/repositories/login.dart';
import 'package:kraya/features/login/domain/usecases/verify_otp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'generate_otp_test.mocks.dart';

class LoginRepositoryTest extends Mock implements LoginRepository {}

@GenerateMocks([LoginRepositoryTest])
void main() {
  late VerifyOtpUseCase usecase;
  late MockLoginRepositoryTest mockRepository;

  setUp(() {
    mockRepository = MockLoginRepositoryTest();
    usecase = VerifyOtpUseCase(mockRepository);
  });

  const phone = "123";
  const code = "123";
  const entity = VerifyOtpEntity(phone: phone, code: code, matched: true);

  test("should verify otp from login repository", () async {
    when(mockRepository.verifyOtp(phone, code)).thenAnswer((_) async => const Right(VerifyOtpEntity(phone: phone, code: code, matched: true)));

    final result = await usecase(Params(phone: phone, code: code));

    expect(result, const Right(entity));

    verify(mockRepository.verifyOtp(phone, code));
    verifyNoMoreInteractions(mockRepository);
  });
}
