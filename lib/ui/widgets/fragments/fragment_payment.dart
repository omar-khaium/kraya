import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_bar/custom_app_bar.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';

class FragmentPayment extends StatefulWidget {
  const FragmentPayment({Key? key}) : super(key: key);

  @override
  State<FragmentPayment> createState() => _FragmentPaymentState();
}

class _FragmentPaymentState extends State<FragmentPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
              ),
            ),
            child: Text(
              "Payment",
              style: TextSystem.instance.extraLarge(ColorSystem.instance.background),
            ),
          ),
        ],
      ),
    );
  }
}
