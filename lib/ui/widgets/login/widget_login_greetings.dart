import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/colors.dart';
import '../../../core/text_style.dart';

class WidgetLoginGreetings extends StatelessWidget {
  const WidgetLoginGreetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n=FlutterLocalization.instance.currentLocale;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 54),
        RichText(
          text: TextSpan(text: l10n?.countryCode, style: TextSystem.instance.extraLarge(ColorSystem.instance.primary).copyWith(fontWeight: FontWeight.bold)),
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
