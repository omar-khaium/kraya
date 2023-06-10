import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../reusable_widgets/widget_lable_text.dart';

class WidgetSearchIconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  const WidgetSearchIconText({Key? key,required this.iconData,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData,color: ColorSystem.instance.primary,),
        const SizedBox(width: 8),
        WidgetLabelText(
            text: text, colorSystem: ColorSystem.instance.text)
      ],
    );
  }
}
