import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48.0,right: 48,top: 16,bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.cashCheck,
                color: ColorSystem.instance.primary,
              ),
              const SizedBox(height: 4),
              Text(
                "Paid",
                style: TextSystem.instance.small(ColorSystem.instance.hint),
              ),
              const SizedBox(height: 4),
              Text(
                "৳ 1,00,000",
                style: TextSystem.instance.small(ColorSystem.instance.text).copyWith(fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Container(
            width: 1,
            decoration: BoxDecoration(
              color: ColorSystem.instance.hint
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.clockOutline,
                color: ColorSystem.instance.primary,
              ),
              const SizedBox(height: 4),
              Text(
                "Due",
                style: TextSystem.instance.small(ColorSystem.instance.hint),
              ),
              const SizedBox(height: 4),
              Text(
                "৳ 1,00,000",
                style: TextSystem.instance.small(ColorSystem.instance.text).copyWith(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
