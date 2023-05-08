import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../reusable_widgets/gradient_button.dart';
import '../../core/text_style.dart';
import 'login/create_account/widget_input_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AlertAddBills extends StatelessWidget {
  final TextEditingController billNameController = TextEditingController();
  final TextEditingController billAmountController = TextEditingController();
  final Function(String, int) onTap;

  AlertAddBills({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          WidgetInput(
              label: "Bill name",
              controller: billNameController,
              icon: Icons.badge_outlined,
              type: TextInputType.text),
          WidgetInput(
              label: "Amount",
              controller: billAmountController,
              icon: MdiIcons.currencyBdt,
              type: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          GradientButton(onPressed: () {}, text: "Submit")
        ],
      ),
    );
  }
}
