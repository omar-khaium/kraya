import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class WidgetTitleText extends StatelessWidget {
  final String text;

  const WidgetTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextSystem.instance.large(ColorSystem.instance.text),
    );
  }
}
