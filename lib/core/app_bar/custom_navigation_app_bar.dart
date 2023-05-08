import 'package:flutter/material.dart';
import '../app_router.dart';
import '../colors.dart';
import '../text_style.dart';

class CustomNavigationAppBar extends StatelessWidget {
  final String firstWord;
  final String lastWord;
  const CustomNavigationAppBar({super.key, required this.firstWord, required this.lastWord});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          backButton(context),
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

Widget backButton(BuildContext context) {
  return IconButton(
    iconSize: 48,
    splashRadius: 28,
    splashColor: ColorSystem.instance.cardDeep,
    onPressed: () => Navigator.of(context).pushNamed(AppRouter.dashboard),
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    padding: EdgeInsets.zero,
    icon: CircleAvatar(
      radius: 24,
      backgroundColor: ColorSystem.instance.primary,
      child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
    ),
  );
}
