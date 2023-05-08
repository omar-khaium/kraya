import 'package:flutter/material.dart';
import '../../core/app_router.dart';
import '../../core/colors.dart';
import '../widgets/login/verify_otp/widget_back_button.dart';
import '../widgets/login/verify_otp/widget_verift_otp_greetings.dart';
import '../widgets/login/verify_otp/widget_verify_otp_form.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: const WidgetBackButton(route: AppRouter.login),
          ),
          const Center(child: WidgetVerifyOtpGreetings()),
          const Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: WidgetVerifyOtpForm(),
          ),
        ],
      ),
    );
  }
}
