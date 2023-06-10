import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/widget_lable_text.dart';
import '../../domain/entity/bill.dart';
import 'search_widget.dart';

class FragmentSubmitBills extends StatefulWidget {
  const FragmentSubmitBills({Key? key}) : super(key: key);

  @override
  State<FragmentSubmitBills> createState() => _FragmentSubmitBillsState();
}

class _FragmentSubmitBillsState extends State<FragmentSubmitBills> {
  final List<Bill> bill = [
    Bill(billName: "Monthly rent", amount: 2500),
    Bill(billName: "Gas", amount: 1400),
    Bill(billName: "Water", amount: 500),
    Bill(billName: "Electricity", amount: 1000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(
            firstWord: "Submit",
            lastWord: "Bills",
            isBackButtonVisible: false,
          ),
          const SizedBox(height: 16),
          SearchWidget(
            onTap: () {},
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return PhysicalModel(
                  color: ColorSystem.instance.card,
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        title: Text(
                          "24 sonali tower",
                          style: TextSystem.instance.normal(ColorSystem.instance.text),
                        ),
                        trailing: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(maximumSize: Size(MediaQuery.of(context).size.width / 5, 36)),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetLabelText(text: "Add bill", colorSystem: ColorSystem.instance.background),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.add,
                                    size: 14,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: WidgetLabelText(text: "Total amount", colorSystem: ColorSystem.instance.hint),
                        subtitle: Text(
                          "৳ 32,000",
                          style: TextSystem.instance.normal(ColorSystem.instance.text).copyWith(fontWeight: FontWeight.w900),
                        ),
                        trailing: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(maximumSize: Size(MediaQuery.of(context).size.width / 5, 36)),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetLabelText(text: "Send bill", colorSystem: ColorSystem.instance.background),
                                  const SizedBox(width: 8),
                                  Icon(
                                    MdiIcons.sendCircleOutline,
                                    size: 14,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      ExpansionTile(
                        initiallyExpanded: false,
                        title: const Text("Bills"),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8),
                            itemCount: bill.length,
                            itemBuilder: (context, int index) {
                              final Bill billModel = bill.elementAt(index);
                              return ListTile(
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                leading: WidgetLabelText(
                                  text: billModel.billName,
                                  colorSystem: ColorSystem.instance.text,
                                ),
                                trailing: WidgetLabelText(
                                  text: billModel.amount.toString(),
                                  colorSystem: ColorSystem.instance.text,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 8,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget billsItem() {
  return Expandable(
    collapsed: const Text("Text"),
    expanded: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (context, int index) {
        return ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: WidgetLabelText(
            text: "Bill",
            colorSystem: ColorSystem.instance.text,
          ),
          trailing: WidgetLabelText(
            text: "Amount",
            colorSystem: ColorSystem.instance.text,
          ),
        );
      },
    ),
  );
}
