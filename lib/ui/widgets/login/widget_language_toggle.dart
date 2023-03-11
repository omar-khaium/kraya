import 'package:flutter/cupertino.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/text_style.dart';

class WidgetLanguageToggle extends StatefulWidget {
  const WidgetLanguageToggle({Key? key}) : super(key: key);

  @override
  State<WidgetLanguageToggle> createState() => _WidgetLanguageToggleState();
}

class _WidgetLanguageToggleState extends State<WidgetLanguageToggle> {
  LanguageEnum languageSelection = LanguageEnum.english;
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<LanguageEnum>(
      children: {
        LanguageEnum.english: Text(
          "English",
          style: TextSystem.instance
              .small(languageSelection == LanguageEnum.english ? ColorSystem.instance.alternateText : ColorSystem.instance.text),
        ),
        LanguageEnum.bangla: Text(
          "বাংলা",
          style: TextSystem.instance
              .small(languageSelection == LanguageEnum.bangla ? ColorSystem.instance.alternateText : ColorSystem.instance.text),
        ),
      },
      groupValue: languageSelection,
      backgroundColor: ColorSystem.instance.background,
      thumbColor: ColorSystem.instance.primary,
      padding: EdgeInsets.zero,
      onValueChanged: (selection) {
        setState(() {
          languageSelection = selection ?? LanguageEnum.english;
        });
      },
    );
  }
}
