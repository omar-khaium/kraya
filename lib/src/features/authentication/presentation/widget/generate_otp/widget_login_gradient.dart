import 'package:flutter/material.dart';
import '../../../../../core/colors.dart';

class WidgetGradient extends StatelessWidget {
  final Size size;
  const WidgetGradient({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 4,
      height: size.width * 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 2),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
        ),
        boxShadow: [
          BoxShadow(color: ColorSystem.instance.primary, blurRadius: 16, spreadRadius: 4, offset: const Offset(0, 1)),
        ],
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: size.width * .1),
      child: const Icon(Icons.home_rounded, color: Colors.white, size: 144),
    );
  }
}
