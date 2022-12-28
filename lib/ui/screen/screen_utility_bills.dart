import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/custom_app_bar.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/gradient_button.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/model/bill.dart';
import 'package:kraya/ui/widgets/alert_add_bills.dart';
import 'package:kraya/ui/widgets/login/verify_otp/widget_back_button.dart';
import 'package:kraya/ui/widgets/login/widget_language_toggle.dart';
import 'package:kraya/ui/widgets/login/widget_login_form.dart';
import 'package:kraya/ui/widgets/login/widget_login_gradient.dart';
import 'package:kraya/ui/widgets/login/widget_login_greetings.dart';

class UtilityBillsScreen extends StatefulWidget {
  const UtilityBillsScreen({super.key});

  @override
  State<UtilityBillsScreen> createState() => _UtilityBillsScreenState();
}

class _UtilityBillsScreenState extends State<UtilityBillsScreen> {
  final List<Bill> bills = [];
  String billName = '';
  int billAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(firstWord: "Add", lastWord: "Bills"),
          Expanded(
            child: GridView.builder(
              itemCount: bills.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Text(billName),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorSystem.instance.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: ColorSystem.instance.background,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (_) => AlertAddBills(
              onTap: (billNAME, amount) {
                billName = billNAME;
                billAmount = amount;
                bills.add(Bill.name(billName, billAmount));
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
