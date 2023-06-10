import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'generate_otp_event.dart';
part 'generate_otp_state.dart';

class GenerateOtpBloc extends Bloc<GenerateOtpEvent, GenerateOtpState> {
  final FirebaseAuth firebaseAuth;
  GenerateOtpBloc({
    required this.firebaseAuth,
  }) : super(GenerateOtpInitial()) {
    on<GenerateOtpEvent>((event, emit) async {
      if (event is GenerateOtp) {
        emit(GenerateOtpLoading());
        try {
          await firebaseAuth.verifyPhoneNumber(
            phoneNumber: "+88${event.phone}",
            verificationCompleted: (_) {
              add(_AutoVerified());
            },
            verificationFailed: (exception) {
              if (exception.code == 'invalid-phone-number') {
                add(const _Error(message: 'The provided phone number is not valid.'));
              } else {
                add(_Error(message: exception.message ?? exception.toString()));
              }
            },
            codeSent: (id, resendToken) {
              add(_Done(verificationId: id, forceResendingToken: resendToken));
            },
            codeAutoRetrievalTimeout: (id) {
              if (!isClosed) {
                add(const _Error(message: "Timeout! Please try again."));
              }
            },
          );
        } catch (error) {
          emit(GenerateOtpError(message: error.toString()));
        }
      } else if (event is _AutoVerified) {
        emit(GenerateOtpAutoVerified());
      } else if (event is _Error) {
        emit(GenerateOtpError(message: event.message));
      } else if (event is _Done) {
        emit(GenerateOtpDone(verificationId: event.verificationId, forceResendingToken: event.forceResendingToken));
      }
    });
  }
}
