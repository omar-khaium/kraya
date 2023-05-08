import 'package:flutter/material.dart';
import '../../../core/colors.dart';

import '../payment/finance_information.dart';
import '../payment/payment_information.dart';
import '../payment/payment_status.dart';

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
            bottom: 0,
            left: 16,
            right: 16,
            top: MediaQuery.of(context).size.height * .5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: ColorSystem.instance.background,
              child: const Center(
                child: PaymentStatus(),
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height*.5,
              child: Container(
                height: MediaQuery.of(context).size.height*.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientStart],
                                ),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16))
                              ),
                child: const FinanceInformation(),
              )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*.4-48,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 80,
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
