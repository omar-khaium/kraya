import 'package:flutter/material.dart';
import 'package:kraya/core/app_bar/custom_app_bar.dart';
import 'package:kraya/ui/reusable_widgets/gradient_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/colors.dart';
import '../widgets/login/create_account/widget_input_text.dart';
import '../widgets/profile/bank_information.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController branchNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(
                firstWord: "Add Bank", lastWord: "Account", isBackButtonVisible: true),
            const SizedBox(height: 24),
            const BankInformationCard(),
            const SizedBox(height: 24),
            WidgetInput(
              label: "Card holder name",
              controller: cardHolderNameController,
              icon: Icons.person_outline_rounded,
              type: TextInputType.name,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Bank name",
              controller: bankNameController,
              icon: MdiIcons.bank,
              type: TextInputType.name,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Account number",
              controller: accountNumberController,
              icon: Icons.confirmation_number_outlined,
              type: TextInputType.number,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Branch name",
              controller: branchNumberController,
              icon: MdiIcons.officeBuilding,
              type: TextInputType.name,
            ),
            const SizedBox(height: 64),
            Align(
                alignment: Alignment.bottomCenter,
                child: GradientButton(onPressed: () {}, text: "Add account".toUpperCase()))
          ],
        ),
      ),
    );
  }
}
