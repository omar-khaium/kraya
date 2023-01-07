import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraya/business_logic/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:kraya/model/bill.dart';
import 'package:kraya/ui/screen/screen_add_property.dart';
import 'package:kraya/ui/screen/screen_confirm_property.dart';
import 'package:kraya/ui/screen/screen_dashboard.dart';
import 'package:kraya/ui/screen/screen_new_user_type_selection.dart';
import 'package:kraya/ui/screen/screen_utility_bills.dart';

import '../ui/screen/screen_create_account.dart';
import '../ui/screen/screen_login.dart';
import '../ui/screen/screen_otp_verification.dart';

class AppRouter {
  static const String login = "/login";
  static const String otpVerification = "/login/otp-verification";
  static const String newUserTypeSelectionScreen = "/login/new-user-type-selection";
  static const String createAccount = "/create-account";
  static const String addProperty = "/add-property";
  static const String utilityBills = "/utility_bills";
  static const String confirmProperty = "/confirm_property";
  static const String dashboard = "/dashboard";

  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => BottomNavigationCubit(),
              child: const ScreenDashboard(),
            ));
      case otpVerification:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
      case newUserTypeSelectionScreen:
        return MaterialPageRoute(builder: (_) => const NewUserTypeSelectionScreen());
      case createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case addProperty:
        return MaterialPageRoute(builder: (_) => const AddPropertyScreen());
      case utilityBills:
        return MaterialPageRoute(builder: (_) => const UtilityBillsScreen());
      case confirmProperty:
        final List<Bill> bills = settings.arguments as List<Bill>;
        return MaterialPageRoute(
            builder: (_) =>
                ConfirmPropertyScreen(
                  billsList: bills,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
