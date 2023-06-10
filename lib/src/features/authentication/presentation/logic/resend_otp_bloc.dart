import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final FirebaseAuth firebaseAuth;
  ResendOtpBloc({
    required this.firebaseAuth,
  }) : super(ResendOtpInitial()) {
    on<ResendOtpEvent>((event, emit) async {
      if (event is ResendOtp) {
        emit(ResendOtpLoading());
        await firebaseAuth.verifyPhoneNumber(
          phoneNumber: event.phone,
          verificationCompleted: (_) {
            emit(ResendOtpAutoVerified());
          },
          verificationFailed: (exception) {
            if (exception.code == 'invalid-phone-number') {
              emit(const ResendOtpError(message: 'The provided phone number is not valid.'));
            } else {
              emit(ResendOtpError(message: exception.message ?? exception.toString()));
            }
          },
          codeSent: (id, resendToken) {
            emit(ResendOtpDone(verificationId: id, forceResendingToken: resendToken));
          },
          codeAutoRetrievalTimeout: (id) {
            emit(const ResendOtpError(message: "Timeout! Please try again."));
          },
        );
      }
    });
  }
}
