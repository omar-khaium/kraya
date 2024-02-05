import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../reusable_widgets/widget_lable_text.dart';

class VaratiaInformationWidget extends StatelessWidget {
  final String titleText;
  final String titleTextValue;
  const VaratiaInformationWidget({super.key, required this.titleText, required this.titleTextValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "$titleText : ",
          colorSystem: ColorSystem.instance.hint,
        ),
        const SizedBox(width: 8),
        CustomText(
          text: titleTextValue,
          colorSystem: ColorSystem.instance.text,
        ),
      ],
    );
  }
}
