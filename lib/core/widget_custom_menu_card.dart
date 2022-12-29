import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/text_style.dart';

class WidgetMenuCard extends StatelessWidget {
  final String text;
  final int amount;
  final IconData iconData;
  final Function onTap;

  WidgetMenuCard({Key? key, required this.text, required this.iconData, required this.onTap, required this.amount})
      : super(key: key);

  PropertySelection propertyType = PropertySelection.none;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 36,
                    width: 36,
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
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: TextSystem.instance.verySmall(ColorSystem.instance.text),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CupertinoSwitch(value: true, onChanged: (value) {},activeColor: ColorSystem.instance.primary,)),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "৳ ${amount.toString()}",
                      style: TextSystem.instance.large(ColorSystem.instance.primary),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
