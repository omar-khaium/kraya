import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../widget/generate_otp/widget_language_toggle.dart';
import '../widget/generate_otp/widget_login_form.dart';
import '../widget/generate_otp/widget_login_gradient.dart';
import '../widget/generate_otp/widget_login_greetings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Stack(
        children: [
          Positioned(
            top: -size.width * 3.25,
            left: -size.width,
            right: -size.width,
            child: WidgetGradient(size: size),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: const WidgetLanguageToggle(),
          ),
          const Center(child: WidgetLoginGreetings()),
          const Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: WidgetLoginForm(),
          ),
        ],
      ),
    );
  }
}
