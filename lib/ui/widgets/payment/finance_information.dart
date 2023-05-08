import 'package:flutter/material.dart';
import '../search_property/search_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/colors.dart';
import '../../../core/text_style.dart';
import '../../reusable_widgets/widget_lable_text.dart';
import '../../reusable_widgets/widget_title_text.dart';

class FinanceInformation extends StatelessWidget {
  const FinanceInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchWidget(onTap: () {}),
            const SizedBox(height: 16),
            WidgetLabelText(
              text: 'Finance',
              colorSystem: ColorSystem.instance.background,
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.all(0),
              horizontalTitleGap: 0,
              leading: Icon(
                MdiIcons.currencyBdt,
                color: ColorSystem.instance.background,
              ),
              title: WidgetTitleText(
                text: '1,00,000',
                colorSystem: ColorSystem.instance.background,
              ),
              subtitle: WidgetLabelText(
                text: 'Total amount',
                colorSystem: ColorSystem.instance.background,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Month : June",
                    style: TextSystem.instance.small(ColorSystem.instance.background),
                  ),
                  Icon(
                    MdiIcons.unfoldMoreHorizontal,
                    color: ColorSystem.instance.background,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
