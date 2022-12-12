import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool hideIcon;
  final bool smallText;
  const GradientButton({super.key, this.hideIcon = true, this.smallText = false, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
          ),
          boxShadow: [
            BoxShadow(
              color: ColorSystem.instance.primary,
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: hideIcon
            ? Text(text, style: TextSystem.instance.button(Colors.white, smallText))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(text, style: TextSystem.instance.button(Colors.white, smallText)),
                  const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white),
                ],
              ),
      ),
    );
  }
}
