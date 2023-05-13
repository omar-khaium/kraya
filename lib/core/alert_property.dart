import 'package:flutter/material.dart';

import '../ui/reusable_widgets/gradient_button.dart';
import 'app_router.dart';
import 'colors.dart';
import 'text_button.dart';
import 'text_style.dart';

class AlertAskForAddProperty extends StatelessWidget {
  const AlertAskForAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      color: ColorSystem.instance.background,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Would you like to",
              style: TextSystem.instance.small(ColorSystem.instance.hint),
            ),
            const SizedBox(height: 4),
            Text(
              "Add property?",
              style: TextSystem.instance.tooLarge(ColorSystem.instance.text),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AlternateButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(AppRouter.dashboard);
                    },
                    text: "Skip",
                    hideIcon: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: GradientButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(AppRouter.addProperty);
                    },
                    text: "Add property",
                    hideIcon: true,
                    smallText: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
