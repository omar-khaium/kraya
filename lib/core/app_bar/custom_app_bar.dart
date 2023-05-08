import 'package:flutter/material.dart';
import '../colors.dart';
import '../text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String firstWord;
  final String lastWord;
  final bool isBackButtonVisible;
  const CustomAppBar({super.key, required this.firstWord, required this.lastWord,required this.isBackButtonVisible});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          backButton(context,isBackButtonVisible),
          RichText(
            text: TextSpan(
              text: "$firstWord ",
              style: TextSystem.instance.tooLarge(ColorSystem.instance.text),
              children: [
                TextSpan(text: lastWord, style: TextSystem.instance.tooLarge(ColorSystem.instance.primary)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

Widget backButton(BuildContext context,bool isVisible) {
  return Visibility(
    visible: isVisible==true,
    child: IconButton(
      iconSize: 48,
      splashRadius: 28,
      splashColor: ColorSystem.instance.cardDeep,
      onPressed: () => Navigator.of(context).pop(),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      padding: EdgeInsets.zero,
      icon: CircleAvatar(
        radius: 24,
        backgroundColor: ColorSystem.instance.primary,
        child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      ),
    ),
  );
}
