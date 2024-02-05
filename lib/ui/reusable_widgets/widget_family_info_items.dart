import 'package:flutter/material.dart';
import 'package:kraya/model/family_information.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';

import '../../core/colors.dart';

// ignore: must_be_immutable
class WidgetFamilyInformationItems extends StatelessWidget {
  late FamilyInformation familyInformation;
  final Function onTap;
  WidgetFamilyInformationItems({
    Key? key,
    required this.familyInformation,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: PhysicalModel(
          color: ColorSystem.instance.card,
          elevation: 7,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: "👤 : ${familyInformation.name}",
                  colorSystem: ColorSystem.instance.text,
                ),
                CustomText(
                  text: "㊁ : ${familyInformation.age}",
                  colorSystem: ColorSystem.instance.text,
                ),
                CustomText(
                  text: "💼 : ${familyInformation.occupation}",
                  colorSystem: ColorSystem.instance.text,
                ),
                CustomText(
                  text: "👨‍👨‍👧‍👧: ${familyInformation.relation}",
                  colorSystem: ColorSystem.instance.text,
                ),
              ],
            ),
          )),
    );
  }
}
