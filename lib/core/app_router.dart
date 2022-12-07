import 'package:flutter/material.dart';
import 'package:kraya/login/screen_create_account.dart';
import 'package:kraya/login/screen_login.dart';
import 'package:kraya/login/screen_new_user_type_selection.dart';
import 'package:kraya/login/screen_otp_verification.dart';

class AppRouter {
  static const String login = "/login";
  static const String otpVerification = "/login/otp-verification";
  static const String newUserTypeSelectionScreen = "/login/new-user-type-selection";
  static const String createAccount = "/create-account";
  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otpVerification:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
      case newUserTypeSelectionScreen:
        return MaterialPageRoute(builder: (_) => const NewUserTypeSelectionScreen());
      case createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
