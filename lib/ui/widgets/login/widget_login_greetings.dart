import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetLoginGreetings extends StatelessWidget {
  const WidgetLoginGreetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n=AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 54),
        RichText(
          text: TextSpan(text: l10n.appName, style: TextSystem.instance.extraLarge(ColorSystem.instance.primary).copyWith(fontWeight: FontWeight.bold)),
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
