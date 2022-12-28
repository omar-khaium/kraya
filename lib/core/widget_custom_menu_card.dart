import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/text_style.dart';

class WidgetMenuCard extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  WidgetMenuCard({Key? key, required this.text, required this.iconData, required this.onTap}) : super(key: key);

  PropertySelection propertyType = PropertySelection.none;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 88,
        child: PhysicalModel(
          color: ColorSystem.instance.cardDeep,
          elevation: 2,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: ColorSystem.instance.primary,
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: TextSystem.instance.small(ColorSystem.instance.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
