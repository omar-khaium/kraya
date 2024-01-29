import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';

// ignore: must_be_immutable
class InputCopy extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;
  final String? Function(String?) validator;
  late bool validate;

  @override
  State<InputCopy> createState() => _InputCopyState();

  InputCopy({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.type,
    required this.validator,
    this.validate=false,
  });
}

class _InputCopyState extends State<InputCopy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 2,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.type,
            validator: widget.validator,
            onChanged: (value) {
              widget.validate=true;
            },
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
