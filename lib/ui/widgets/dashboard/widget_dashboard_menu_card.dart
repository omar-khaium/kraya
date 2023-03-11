import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class WidgetDashboardMenuCard extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  const WidgetDashboardMenuCard(
      {Key? key, required this.text, required this.iconData, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: PhysicalModel(
        color: ColorSystem.instance.cardDeep,
        elevation: 7,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: ColorSystem.instance.primary,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: TextSystem.instance.small(ColorSystem.instance.text).copyWith(fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
