import 'package:flutter/material.dart';
import '../../reusable_widgets/widget_lable_text.dart';
import '../../reusable_widgets/widget_title_text.dart';

import '../../../core/colors.dart';

class BankInformationCard extends StatelessWidget {
  const BankInformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/6,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorSystem.instance.background,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WidgetLabelText(
                        text: "Account name", colorSystem: ColorSystem.instance.background),
                    WidgetTitleText(
                      text: 'John doe',
                      colorSystem: ColorSystem.instance.background,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height:MediaQuery.of(context).size.height/30),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetLabelText(
                        text: "Bank", colorSystem: ColorSystem.instance.background),
                    WidgetTitleText(
                      text: 'Sonali Bank Limited',
                      colorSystem: ColorSystem.instance.background,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WidgetLabelText(
                        text: "Account number", colorSystem: ColorSystem.instance.background),
                    WidgetTitleText(
                      text: '017238972472394',
                      colorSystem: ColorSystem.instance.background,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
