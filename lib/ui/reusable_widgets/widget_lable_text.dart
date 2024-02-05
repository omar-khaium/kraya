import 'package:flutter/material.dart';
import '../../core/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color colorSystem;

  const CustomText({Key? key, required this.text, required this.colorSystem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextSystem.instance.small(colorSystem),
    );
  }
}
