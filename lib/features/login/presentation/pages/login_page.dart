import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../ui/widgets/login/widget_language_toggle.dart';
import '../../../../ui/widgets/login/widget_login_form.dart';
import '../../../../ui/widgets/login/widget_login_gradient.dart';
import '../../../../ui/widgets/login/widget_login_greetings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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