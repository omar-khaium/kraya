import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';

class WidgetDateOfBirth extends StatelessWidget {
  const WidgetDateOfBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date of birth", style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 4,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time_rounded, color: ColorSystem.instance.primary),
                const SizedBox(width: 12),
                Text("Date of birth", style: TextSystem.instance.normal(ColorSystem.instance.text)),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
