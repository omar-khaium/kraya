import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraya/features/login/domain/entities/generate_otp.dart';
import 'package:kraya/features/login/domain/repositories/login.dart';
import 'package:kraya/features/login/domain/usecases/generate_otp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'generate_otp_test.mocks.dart';

class LoginRepositoryTest extends Mock implements LoginRepository {}

@GenerateMocks([LoginRepositoryTest])
void main() {
  late GenerateOtpUseCase usecase;
  late MockLoginRepositoryTest mockRepository;

  setUp(() {
    mockRepository = MockLoginRepositoryTest();
    usecase = GenerateOtpUseCase(mockRepository);
  });

  const phone = "123";
  const entity = GenerateOtpEntity(phone: "123");

  test("should get response from login repository", () async {
    when(mockRepository.generateOtp(phone)).thenAnswer((_) async => const Right(GenerateOtpEntity(phone: phone)));

    final result = await usecase.execute(phone: phone);

    expect(result, const Right(entity));

    verify(mockRepository.generateOtp(phone));
    verifyNoMoreInteractions(mockRepository);
  });
}
