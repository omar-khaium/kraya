import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraya/features/login/domain/entities/generate_otp.dart';
import 'package:kraya/features/login/domain/repositories/login.dart';
import 'package:kraya/features/login/domain/usecases/generate_otp.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late GenerateOtpUseCase usecase;
  late MockLoginRepository repository;

  setUp(() {
    repository = MockLoginRepository();
    usecase = GenerateOtpUseCase(repository);
  });

  final phone = "123";
  final generateOtp = GenerateOtpEntity(phone: "123");

  test("should get response from login repository", () {
    when(repository.generateOtp(phone)).thenAnswer((_) async => Right(generateOtp));

    final result = usecase.execute(phone: phone);

    expect(result, Right(generateOtp));

    verify(repository.generateOtp(phone));
    verifyNoMoreInteractions(repository);
  });
}
