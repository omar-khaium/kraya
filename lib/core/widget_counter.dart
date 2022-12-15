import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WidgetCounter extends StatelessWidget {
  final String text;
  const WidgetCounter({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TextSystem.instance.small(ColorSystem.instance.hint),),
        const SizedBox(height: 6),
        PhysicalModel(
          color: ColorSystem.instance.card,
          elevation: 2,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: ColorSystem.instance.primary,
                    child:  Icon(MdiIcons.minus,color:ColorSystem.instance.background),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "3",
                    style: TextSystem.instance.normal(ColorSystem.instance.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: ColorSystem.instance.primary,
                    child:  Icon(Icons.add,color: ColorSystem.instance.background,),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}