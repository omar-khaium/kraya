import 'package:flutter/material.dart';
import 'package:kraya/login/screen_add_property.dart';
import 'package:kraya/login/screen_new_user_type_selection.dart';

import '../ui/screen/screen_create_account.dart';
import '../ui/screen/screen_login.dart';
import '../ui/screen/screen_otp_verification.dart';

class AppRouter {
  static const String login = "/login";
  static const String otpVerification = "/login/otp-verification";
  static const String newUserTypeSelectionScreen = "/login/new-user-type-selection";
  static const String createAccount = "/create-account";
  static const String addProperty = "/add-property";
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
      case addProperty:
        return MaterialPageRoute(builder: (_) => const AddPropertyScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}