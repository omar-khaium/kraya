import 'package:flutter/material.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text_copy.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../reusable_widgets/gradient_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/colors.dart';
import '../widgets/profile/bank_information.dart';
import '../widgets/singleton_task_notifier.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomAppBar(firstWord: "Add Bank", lastWord: "Account", isBackButtonVisible: true),
              const SizedBox(height: 24),
              const BankInformationCard(),
              const SizedBox(height: 24),
              InputCopy(
                label: "Card holder name",
                controller: cardHolderNameController,
                icon: Icons.person_outline_rounded,
                type: TextInputType.name,
                validator: (cardHolderName) {
                  if(cardHolderName==null){
                    return "Invalid card holder name";
                  }
                  return cardHolderName.isEmpty ?" *Required" :null;
                },
              ),
              const SizedBox(height: 16),
              InputCopy(
                label: "Bank name",
                controller: bankNameController,
                icon: MdiIcons.bank,
                type: TextInputType.name,
                validator: (bankName) {
                  if(bankName==null){
                    return "Invalid bank name";
                  }
                  return bankName.isEmpty ?" *Required" :null;
                },
              ),
              const SizedBox(height: 16),
              InputCopy(
                label: "Account number",
                controller: accountNumberController,
                icon: Icons.confirmation_number_outlined,
                type: TextInputType.number,
                validator: (accountNumber) {
                  if(accountNumber==null){
                    return "Invalid account number";
                  }
                  return accountNumber.isEmpty ?" *Required" :null;
                },
              ),
              const SizedBox(height: 16),
              InputCopy(
                label: "Branch name",
                controller: branchNameController,
                icon: MdiIcons.officeBuilding,
                type: TextInputType.name,
                validator: (branchName) {
                  if(branchName==null){
                    return "Invalid branch name";
                  }
                  return branchName.isEmpty ?" *Required" :null;
                },
              ),
              const SizedBox(height: 64),
              Align(
                alignment: Alignment.bottomCenter,
                child: GradientButton(
                  onPressed: () {
                    if(formKey.currentState?.validate() ?? false){
                      Navigator.of(context).pop();
                    }
                    else{
                      TaskNotifier.instance.warning(
                        context,
                        message: "Please complete the form",
                      );
                    }
                  },
                  text: "Add account".toUpperCase(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
