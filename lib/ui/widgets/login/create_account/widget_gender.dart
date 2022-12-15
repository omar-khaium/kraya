import 'package:flutter/cupertino.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/text_style.dart';

class WidgetGender extends StatefulWidget {
  const WidgetGender({Key? key}) : super(key: key);

  @override
  State<WidgetGender> createState() => _WidgetGenderState();
}

class _WidgetGenderState extends State<WidgetGender> {
  GenderSelection genderSelection = GenderSelection.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 4,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CupertinoSlidingSegmentedControl<GenderSelection>(
              children: {
                GenderSelection.male: Text(
                  "Male",
                  style: TextSystem.instance.normal(
                      genderSelection == GenderSelection.male ? ColorSystem.instance.alternateText : ColorSystem.instance.text),
                ),
                GenderSelection.female: Text(
                  "Female",
                  style: TextSystem.instance.normal(
                      genderSelection == GenderSelection.female ? ColorSystem.instance.alternateText : ColorSystem.instance.text),
                ),
              },
              groupValue: genderSelection,
              backgroundColor: ColorSystem.instance.background,
              thumbColor: ColorSystem.instance.primary,
              padding: EdgeInsets.zero,
              onValueChanged: (selection) {
                setState(() {
                  genderSelection = selection ?? GenderSelection.male;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
