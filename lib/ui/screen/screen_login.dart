import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/gradient_button.dart';
import 'package:kraya/ui/widgets/login/widget_language_toggle.dart';
import 'package:kraya/ui/widgets/login/widget_login_form.dart';
import 'package:kraya/ui/widgets/login/widget_login_gradient.dart';
import 'package:kraya/ui/widgets/login/widget_login_greetings.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
            child: WidgetGradient(size:size),
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
