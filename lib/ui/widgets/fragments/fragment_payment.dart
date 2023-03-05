import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_bar/custom_app_bar.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';

import '../payment_information.dart';

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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: ColorSystem.instance.background,
              child: const Center(
                child: Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .5,
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
                    ),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
                child: const Center(
                  child: Text(
                    'Bottom Widget',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * .4 - 54,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: PhysicalModel(
                elevation: 5,
                color: ColorSystem.instance.background,
                borderRadius: BorderRadius.circular(8),
                child: const PaymentInformation(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
