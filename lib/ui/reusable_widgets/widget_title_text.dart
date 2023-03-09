import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class WidgetTitleText extends StatelessWidget {
  final String text;
  final Color colorSystem;

  const WidgetTitleText({Key? key, required this.text,required this.colorSystem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextSystem.instance.large(colorSystem),
    );
  }
}
