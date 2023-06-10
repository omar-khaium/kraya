import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.dart';
import '../widget/verify_otp/widget_back_button.dart';
import '../widget/verify_otp/widget_verift_otp_greetings.dart';
import '../widget/verify_otp/widget_verify_otp_form.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phone;
  final String verificationId;
  final int? forceResendingToken;
  const OtpVerificationScreen({
    super.key,
    required this.phone,
    required this.verificationId,
    this.forceResendingToken,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: const WidgetBackButton(route: RouteNames.login),
          ),
          const Center(child: WidgetVerifyOtpGreetings()),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: WidgetVerifyOtpForm(
              phone: phone,
              verificationId: verificationId,
              forceResendingToken: forceResendingToken,
            ),
          ),
        ],
      ),
    );
  }
}
