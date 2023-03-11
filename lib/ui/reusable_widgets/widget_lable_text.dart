import 'package:flutter/material.dart';
import 'package:kraya/core/text_style.dart';

class WidgetLabelText extends StatelessWidget {
  final String text;
  final Color colorSystem;

  const WidgetLabelText({Key? key, required this.text,required this.colorSystem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextSystem.instance.small(colorSystem),
    );
  }
}
