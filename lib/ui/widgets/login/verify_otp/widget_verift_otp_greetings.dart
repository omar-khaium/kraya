import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class WidgetVerifyOtpGreetings extends StatelessWidget {
  const WidgetVerifyOtpGreetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: ColorSystem.instance.primary,
          radius: MediaQuery.of(context).size.shortestSide * .2,
          child: Icon(Icons.phone_android_rounded, color: Colors.white, size: MediaQuery.of(context).size.shortestSide * .2),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: "OTP",
            style: TextSystem.instance.large(ColorSystem.instance.primary),
            children: [TextSpan(text: " verification", style: TextSystem.instance.large(ColorSystem.instance.text))],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
