import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';

class WidgetInputText extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;


  @override
  State<WidgetInputText> createState() => _WidgetInputTextState();

  const WidgetInputText({super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.type,
  });
}

class _WidgetInputTextState extends State<WidgetInputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 4,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.type,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon, color: ColorSystem.instance.primary),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
