import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../features/authentication/presentation/logic/generate_otp_bloc.dart';
import '../features/authentication/presentation/logic/resend_otp_bloc.dart';
import '../features/authentication/presentation/logic/verify_otp_bloc.dart';
import '../features/init/presentation/logic/session_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerFactory(
    () => SessionBloc(),
  );

  //! Generate OTP -> begins
  sl.registerFactory(
    () => GenerateOtpBloc(firebaseAuth: sl()),
  );
  sl.registerFactory(
    () => ResendOtpBloc(firebaseAuth: sl()),
  );
  sl.registerFactory(
    () => VerifyOtpBloc(firebaseAuth: sl()),
  );

  //! Generate OTP -> ends

  //! Core configuration -> begins
  sl.registerFactory(
    () => FirebaseAuth.instanceFor(
      app: sl(),
    ),
  );

  sl.registerFactory(
    () => Firebase.app(),
  );
  //! Core configuration -> ends
}
