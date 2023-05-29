import 'package:flutter/material.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text_copy.dart';
import '../../core/colors.dart';
import '../reusable_widgets/gradient_button.dart';
import '../../core/text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AlertAddBills extends StatelessWidget {
  final TextEditingController billNameController = TextEditingController();
  final TextEditingController billAmountController = TextEditingController();
  final Function(String, int) onTap;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AlertAddBills({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: TextSystem.instance.large(ColorSystem.instance.text),
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
                return billName.isEmpty ? " *Bill name is Required" : null;
              },
            ),
            InputCopy(
              label: "Amount",
              controller: billAmountController,
              icon: MdiIcons.currencyBdt,
              type: TextInputType.number,
              validator: (amount) {
                if (amount == null) {
                  return "Invalid amount";
                }
                return amount.isEmpty ? " *Amount is Required" : null;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            GradientButton(onPressed: () {
              if(formKey.currentState?.validate() ?? false){
                Navigator.of(context).pop();
              }
            }, text: "Submit")
          ],
        ),
      ),
    );
  }
}
