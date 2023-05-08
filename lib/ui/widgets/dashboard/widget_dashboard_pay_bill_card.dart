import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/text_style.dart';

class WidgetDashboardPayBillCard extends StatelessWidget {
  final String text;
  final IconData iconData;

  const WidgetDashboardPayBillCard(
      {Key? key, required this.text, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: ColorSystem.instance.cardDeep,
      elevation: 7,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
              ),
            ),
            child: Icon(
              iconData,
              size: 18,
              color: ColorSystem.instance.background,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextSystem.instance.small(ColorSystem.instance.text).copyWith(fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
