import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';

class WidgetCardSelection extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const WidgetCardSelection({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: PhysicalModel(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        color: selected ? ColorSystem.instance.primary : ColorSystem.instance.card,
        shadowColor: selected ? ColorSystem.instance.primary : ColorSystem.instance.cardDeep,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: selected ? Colors.white : ColorSystem.instance.primary),
                Text(
                  label,
                  style: TextSystem.instance.normal(selected ? Colors.white : ColorSystem.instance.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
