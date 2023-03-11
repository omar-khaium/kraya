import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class WidgetConfirmPropertyBillsCard extends StatelessWidget {
  final String text;
  final int amount;
  final IconData iconData;
  final Function onTap;

  const WidgetConfirmPropertyBillsCard({Key? key, required this.text, required this.iconData, required this.onTap, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: ColorSystem.instance.cardDeep,
      elevation: 7,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 36,
            width: 36,
            margin:const EdgeInsets.all(16),
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
              color: ColorSystem.instance.background,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "৳ ${amount.toString()}",
                  style: TextSystem.instance.large(ColorSystem.instance.primary),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: TextSystem.instance.verySmall(ColorSystem.instance.text),
              ),
            ],
          )
        ],
      ),
    );
  }
}
