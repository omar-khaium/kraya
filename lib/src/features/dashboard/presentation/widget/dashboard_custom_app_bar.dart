import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';

class DashboardCustomAppBar extends StatelessWidget {
  final String firstWord;
  final IconData iconData;

  const DashboardCustomAppBar({super.key, required this.firstWord, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: 88,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
          ),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 8),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Icon(
          iconData,
          color: ColorSystem.instance.background,
          size: 36,
        ),
        title: Text(
          firstWord,
          style: TextSystem.instance.extraLarge(ColorSystem.instance.background),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "John doe",
                  style: TextSystem.instance.normal(ColorSystem.instance.background),
                ),
                const SizedBox(height: 4),
                Text(
                  "Owner",
                  style: TextSystem.instance.small(ColorSystem.instance.background),
                ),
              ],
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: ColorSystem.instance.background,
              child: ClipOval(
                  child: Image.network(
                      "https://www.shutterstock.com/image-vector/grunge-rubber-stamp-text-custom-260nw-167690960.jpg")),
            )
          ],
        ),
      ),
    );
  }
}

Widget backButton(BuildContext context) {
  return IconButton(
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
  );
}
