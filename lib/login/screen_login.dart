import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/gradient_button.dart';

import '../core/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LanguageEnum languageSelection = LanguageEnum.english;

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
            child: gradient(size),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: languageToggle(),
          ),
          Center(child: greetings()),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: form(),
          ),
        ],
      ),
    );
  }

  Widget gradient(Size size) {
    return Container(
      width: size.width * 4,
      height: size.width * 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 2),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
        ),
        boxShadow: [
          BoxShadow(color: ColorSystem.instance.primary, blurRadius: 16, spreadRadius: 4, offset: const Offset(0, 1)),
        ],
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: size.width * .1),
      child: const Icon(Icons.home_rounded, color: Colors.white, size: 144),
    );
  }

  Widget languageToggle() {
    return CupertinoSlidingSegmentedControl<LanguageEnum>(
      children: {
        LanguageEnum.english: Text(
          "English",
          style: TextSystem.instance
              .small(languageSelection == LanguageEnum.english ? ColorSystem.instance.alternateText : ColorSystem.instance.text),
        ),
        LanguageEnum.bangla: Text(
          "বাংলা",
          style: TextSystem.instance
              .small(languageSelection == LanguageEnum.bangla ? ColorSystem.instance.alternateText : ColorSystem.instance.text),
        ),
      },
      groupValue: languageSelection,
      backgroundColor: ColorSystem.instance.background,
      thumbColor: ColorSystem.instance.primary,
      padding: EdgeInsets.zero,
      onValueChanged: (selection) {
        setState(() {
          languageSelection = selection ?? LanguageEnum.english;
        });
      },
    );
  }

  Widget form() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              labelText: "Enter mobile number",
              labelStyle: TextSystem.instance.small(ColorSystem.instance.hint),
              focusedBorder: const UnderlineInputBorder(),
              enabledBorder: const UnderlineInputBorder(),
              border: const UnderlineInputBorder(),
              contentPadding: EdgeInsets.zero),
        ),
        const SizedBox(height: 8),
        Text(
          "We will send you one time password (OTP)",
          style: TextSystem.instance.verySmall(ColorSystem.instance.hint),
        ),
        const SizedBox(height: 32),
        GradientButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRouter.otpVerification);
          },
          text: "Get OTP",
        ),
      ],
    );
  }

  Widget greetings() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 54),
        RichText(
          text: TextSpan(
            text: "Welcome to\n",
            style: TextSystem.instance.tooLarge(ColorSystem.instance.hint),
            children: [
              TextSpan(text: "Kraya", style: TextSystem.instance.extraLarge(ColorSystem.instance.primary).copyWith(fontWeight: FontWeight.bold))
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        RichText(
          text: TextSpan(
              text: "Sign up",
              style: TextSystem.instance.veryLarge(ColorSystem.instance.primary),
              children: [TextSpan(text: " to create account", style: TextSystem.instance.veryLarge(ColorSystem.instance.text))]),
        ),
      ],
    );
  }
}
