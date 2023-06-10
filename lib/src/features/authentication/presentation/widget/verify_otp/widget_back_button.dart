import 'package:flutter/material.dart';
import '../../../../../core/colors.dart';

class WidgetBackButton extends StatelessWidget {
  final String route;

  const WidgetBackButton({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 48,
      splashRadius: 28,
      splashColor: ColorSystem.instance.cardDeep,
      onPressed: () => route.isNotEmpty ? Navigator.of(context).pop() : Navigator.of(context).pushReplacementNamed(route),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      padding: EdgeInsets.zero,
      icon: CircleAvatar(
        radius: 24,
        backgroundColor: ColorSystem.instance.primary,
        child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      ),
    );
  }
}
