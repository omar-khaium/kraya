import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';

class InputCopy extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;
  final Function(String) onTap;

  @override
  State<InputCopy> createState() => _InputCopyState();

  const InputCopy({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.type,
    required this.onTap,
  });
}

class _InputCopyState extends State<InputCopy> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
              validator: (val) {
                (val?.isNotEmpty ?? false) ? null : "";
                return widget.onTap(val ?? "");
              },
              decoration: InputDecoration(
                prefixIcon: Icon(widget.icon, color: ColorSystem.instance.primary),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
