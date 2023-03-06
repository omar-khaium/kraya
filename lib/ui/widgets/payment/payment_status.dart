import 'package:flutter/material.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';
import 'package:kraya/ui/reusable_widgets/widget_title_text.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WidgetLabelText(text: "Payment information", colorSystem: ColorSystem.instance.text),
          DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Scaffold(
              backgroundColor: ColorSystem.instance.background,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(42),
                child: SizedBox(
                  height: 42,
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
                              child: Text(
                                "All",
                                style: TextSystem.instance.small(ColorSystem.instance.text),
                              ))),
                      Tab(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Paid",
                                style: TextSystem.instance.small(ColorSystem.instance.text),
                              ))),
                      Tab(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Unpaid",
                                style: TextSystem.instance.small(ColorSystem.instance.text),
                              ))),
                    ],
                  ),
                ),
              ),
              body:  TabBarView(
                controller: tabController,
                physics: const ScrollPhysics(),
                children: const [
                  Center(child: Text("All")),
                  Center(child: Text("Paid")),
                  Center(child: Text("Unpaid")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
