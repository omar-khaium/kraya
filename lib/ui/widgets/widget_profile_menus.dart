import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class WidgetProfileMenu extends StatelessWidget {
  final Function onTap;
  final String text;
  final IconData icon;

  const WidgetProfileMenu({required this.onTap, required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap();
      },
      dense:  true,
      visualDensity: VisualDensity.compact,
      leading: Icon(icon,color: ColorSystem.instance.primary,),
      title: Text(text,style: TextSystem.instance.normal(ColorSystem.instance.text),),
    );
  }
}
