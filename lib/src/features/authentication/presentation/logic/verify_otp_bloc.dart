import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final FirebaseAuth firebaseAuth;
  VerifyOtpBloc({
    required this.firebaseAuth,
  }) : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      if (event is VerifyOtp) {
        emit(VerifyOtpLoading());
        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId,
          smsCode: event.code,
        );
        try {
          final response = await firebaseAuth.signInWithCredential(credential);
          if (response.user != null) {
            emit(VerifyOtpDone());
          } else {
            emit(
              const VerifyOtpError(message: "Opps! OTP verification went wrong unexpectedly."),
            );
          }
        } on FirebaseAuthException catch (exception) {
          emit(
            VerifyOtpError(message: exception.message ?? exception.code),
          );
        }
      }
    });
  }
}
