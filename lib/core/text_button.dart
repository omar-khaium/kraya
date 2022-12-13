import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class AlternateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool hideIcon;
  final bool smallText;
  const AlternateButton({super.key, this.hideIcon = true, this.smallText = false, required this.onPressed, required this.text});

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
          color: ColorSystem.instance.primary.withOpacity(.05),
          border: Border.all(color: ColorSystem.instance.primary, width: 2),
        ),
        alignment: Alignment.center,
        child: hideIcon
            ? Text(text, style: TextSystem.instance.button(ColorSystem.instance.primary, smallText))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(text, style: TextSystem.instance.button(ColorSystem.instance.primary, smallText)),
                  Icon(Icons.keyboard_arrow_right_rounded, color: ColorSystem.instance.primary),
                ],
              ),
      ),
    );
  }
}
