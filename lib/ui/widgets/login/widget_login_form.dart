import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/gradient_button.dart';
import 'package:kraya/core/text_style.dart';

class WidgetLoginForm extends StatelessWidget {
  const WidgetLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            //Navigator.of(context).pushReplacementNamed(AppRouter.otpVerification);
            Navigator.of(context).pushReplacementNamed(AppRouter.dashboard);
          },
          text: "Get OTP",
        ),
      ],
    );
  }
}
