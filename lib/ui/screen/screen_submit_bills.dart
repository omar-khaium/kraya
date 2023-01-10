import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/custom_app_bar.dart';
import 'package:kraya/core/gradient_button.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/core/widget_lable_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScreenSubmitBills extends StatefulWidget {
  const ScreenSubmitBills({Key? key}) : super(key: key);

  @override
  State<ScreenSubmitBills> createState() => _ScreenSubmitBillsState();
}

class _ScreenSubmitBillsState extends State<ScreenSubmitBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(firstWord: "Submit", lastWord: "Bills"),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(16),
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
                        title: Text("24 sonali tower",style: TextSystem.instance.normal(ColorSystem.instance.text),),
                        trailing: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(maximumSize: Size(MediaQuery.of(context).size.width/5, 36)),
                              onPressed: () {  },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetLabelText(text: "Add bill", colorSystem: ColorSystem.instance.background),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.add,size: 14,),
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
                              style: ElevatedButton.styleFrom(maximumSize: Size(MediaQuery.of(context).size.width/5, 36)),
                              onPressed: () {  },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetLabelText(text: "Send bill", colorSystem: ColorSystem.instance.background),
                                  const SizedBox(width: 8),
                                  const Icon(MdiIcons.sendCircleOutline,size: 14,),
                                ],
                              ),
                            )),
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
