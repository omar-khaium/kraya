import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';

class Input extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;

  @override
  State<Input> createState() => _InputState();

  const Input({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.type,
  });
}

class _InputState extends State<Input> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String? formFieldValue = "";
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
              validator: (val) => (val?.isNotEmpty ?? false) ? null : "",
              onSaved: (val) {
                formFieldValue = val;
              },
              onChanged: (value){

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
