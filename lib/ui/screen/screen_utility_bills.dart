import 'package:flutter/material.dart';
import '../../core/app_router.dart';
import '../../core/colors.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../reusable_widgets/gradient_button.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/widget_custom_menu_card.dart';
import '../../model/bill.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/login/create_account/widget_input_text_copy.dart';

class UtilityBillsScreen extends StatefulWidget {
  const UtilityBillsScreen({super.key});

  @override
  State<UtilityBillsScreen> createState() => _UtilityBillsScreenState();
}

class _UtilityBillsScreenState extends State<UtilityBillsScreen> {
  final TextEditingController billNameController = TextEditingController();
  final TextEditingController billAmountController = TextEditingController();
  final List<Bill> bills = [];
  String billName = '';
  int billAmount = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(
            firstWord: "Add",
            lastWord: "Bills",
            isBackButtonVisible: true,
          ),
          Expanded(
            child: bills.isEmpty
                ? Center(
                    child: Text(
                      "No bills added yet",
                      style:
                          TextSystem.instance.small(ColorSystem.instance.text),
                    ),
                  )
                : GridView.builder(
                    itemCount: bills.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    itemBuilder: (_, index) {
                      final Bill bill = bills[index];
                      return WidgetMenuCard(
                        text: bill.billName,
                        iconData: Icons.electric_bolt,
                        onTap: () {},
                        amount: bill.amount,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                  ),
          ),
          InkWell(
            onTap: () {
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
                builder: (_) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            child: Text(
                              "Add Bill",
                              style: TextSystem.instance
                                  .large(ColorSystem.instance.text),
                            ),
                          ),
                          InputCopy(
                              label: "Bill name",
                              controller: billNameController,
                              icon: Icons.badge_outlined,
                              type: TextInputType.text,
                              validator: (billName) {
                                if (billName == null) {
                                  return "Invalid bill name";
                                }
                                return billName.isEmpty
                                    ? " *Bill name is Required"
                                    : null;
                              }),
                          InputCopy(
                              label: "Amount",
                              controller: billAmountController,
                              icon: MdiIcons.currencyBdt,
                              type: TextInputType.text,
                              validator: (amount) {
                                if (amount == null) {
                                  return "Invalid amount";
                                }
                                return amount.isEmpty
                                    ? " *Amount is Required"
                                    : null;
                              }),
                          const SizedBox(
                            height: 24,
                          ),
                          GradientButton(
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  setState(() {
                                    bills.add(Bill(
                                        billName: billNameController.text,
                                        amount: int.parse(
                                            billAmountController.text)));
                                    billNameController.text = "";
                                    billAmountController.text = "";
                                    Navigator.of(context).pop();
                                  });
                                }
                              },
                              text: "Submit")
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: ColorSystem.instance.primary,
                    borderRadius: BorderRadius.circular(48)),
                child: Icon(
                  Icons.add,
                  size: 64,
                  color: ColorSystem.instance.background,
                ),
              ),
            ),
          ),
          GradientButton(
            onPressed: () {
              if (bills.isNotEmpty) {
                Navigator.of(context).pushReplacementNamed(
                    AppRouter.confirmProperty,
                    arguments: bills);
              }
            },
            text: "Done",
          ),
        ],
      ),
    );
  }
}
