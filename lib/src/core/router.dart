import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/authentication/presentation/logic/generate_otp_bloc.dart';
import '../features/authentication/presentation/logic/resend_otp_bloc.dart';
import '../features/authentication/presentation/logic/verify_otp_bloc.dart';
import '../features/authentication/presentation/screen/screen_login.dart';
import '../features/authentication/presentation/screen/screen_verify_password.dart';
import '../features/dashboard/presentation/screen/screen_dashboard.dart';
import '../features/init/presentation/screen/initial.dart';
import 'dependency_injector.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: RouteNames.initial,
      builder: (context, state) => const InitialScreen(),
      routes: [
        GoRoute(
          path: "login",
          name: RouteNames.login,
          builder: (context, state) => MultiProvider(
            providers: [
              BlocProvider(create: (_) => sl<GenerateOtpBloc>()),
            ],
            child: const LoginScreen(),
          ),
          routes: const [],
        ),
        GoRoute(
          path: "verify-otp",
          name: RouteNames.verifyOtp,
          builder: (context, state) {
            assert(state.queryParameters.containsKey("phone"));
            assert(state.queryParameters["phone"]?.isNotEmpty ?? false);
            assert(state.queryParameters.containsKey("verification-id"));
            assert(state.queryParameters["verification-id"]?.isNotEmpty ?? false);
            assert(state.queryParameters.containsKey("verification-id"));
            assert(state.queryParameters["verification-id"]?.isNotEmpty ?? false);
            return MultiProvider(
              providers: [
                BlocProvider(create: (_) => sl<ResendOtpBloc>()),
                BlocProvider(create: (_) => sl<VerifyOtpBloc>()),
              ],
              child: OtpVerificationScreen(
                phone: state.queryParameters["phone"]!,
                verificationId: state.queryParameters["verification-id"]!,
                forceResendingToken: int.tryParse(state.queryParameters["force-resending-token"] ?? ""),
              ),
            );
          },
          routes: const [],
        ),
        GoRoute(
          path: "dashboard",
          name: RouteNames.dashboard,
          builder: (context, state) => const DashboardScreen(),
          routes: const [],
        ),
      ],
    ),
  ],
);

class RouteNames {
  static const String initial = "initial";
  static const String login = "login";
  static const String verifyOtp = "verify otp";
  static const String dashboard = "dashboard";
}
