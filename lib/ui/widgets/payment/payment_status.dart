import 'package:flutter/material.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';
import 'package:kraya/ui/widgets/payment/tab_payment_all.dart';
import 'package:kraya/ui/widgets/payment/tab_payment_paid.dart';
import 'package:kraya/ui/widgets/payment/tab_payment_unpaid.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/colors.dart';
import '../../../core/text_style.dart';

class PaymentStatus extends StatefulWidget {
  const PaymentStatus({Key? key}) : super(key: key);

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetLabelText(text: "Payment information", colorSystem: ColorSystem.instance.text),
        Expanded(
          child: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: ColorSystem.instance.background,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(42),
                  child: TabBar(
                    unselectedLabelColor: ColorSystem.instance.hint,
                    controller: tabController,
                    labelColor: ColorSystem.instance.primary,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextSystem.instance.small(ColorSystem.instance.text),
                    unselectedLabelStyle: TextSystem.instance.small(ColorSystem.instance.hint),
                    indicatorWeight: 3,
                    indicatorColor: ColorSystem.instance.primary,
                    physics: const ScrollPhysics(),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    automaticIndicatorColorAdjustment: false,
                    tabs: [
                      Tab(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  const Icon(MdiIcons.formatListBulletedSquare),
                                  const SizedBox(width: 4),
                                  Text(
                                    "All",
                                    style: TextSystem.instance.small(ColorSystem.instance.text),
                                  ),
                                ],
                              ))),
                      Tab(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  const Icon(Icons.done_all_outlined),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Paid",
                                    style: TextSystem.instance.small(ColorSystem.instance.text),
                                  ),
                                ],
                              ))),
                      Tab(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  const Icon(MdiIcons.clockAlertOutline),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Unpaid",
                                    style: TextSystem.instance.small(ColorSystem.instance.text),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ),
                body:  TabBarView(
                  controller: tabController,
                  children: const [
                    TabPaymentAll(),
                    TabPaymentPaid(),
                    TabPaymentUnpaid(),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
