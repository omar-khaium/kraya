import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WidgetCounter extends StatefulWidget {
  final String text;
  final Function(int?) onTap;

  const WidgetCounter({Key? key, required this.text,required this.onTap}) : super(key: key);

  @override
  State<WidgetCounter> createState() => _WidgetCounterState();
}

class _WidgetCounterState extends State<WidgetCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextSystem.instance.small(ColorSystem.instance.hint),
        ),
        const SizedBox(height: 6),
        PhysicalModel(
          color: ColorSystem.instance.card,
          elevation: 2,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (count <= 0) {
                          count = 0;
                        }
                        else {
                          count--;
                        }
                      });
                      widget.onTap(count);
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorSystem.instance.secondaryText,
                      child: Icon(MdiIcons.minus, color: ColorSystem.instance.background),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    count.toString(),
                    style: TextSystem.instance.normal(ColorSystem.instance.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (count < 0) {
                          count = 0;
                        }else {
                          count++;
                        }
                      });
                      widget.onTap(count);
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorSystem.instance.secondaryText,
                      child: Icon(
                        Icons.add,
                        color: ColorSystem.instance.background,
                      ),
                    ),
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
