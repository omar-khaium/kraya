import 'package:flutter/cupertino.dart';
import '../../../core/colors.dart';
import '../../../core/enums.dart';
import '../../../core/text_style.dart';

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
