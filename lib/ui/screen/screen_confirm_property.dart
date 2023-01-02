import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/custom_app_bar.dart';
import 'package:kraya/core/gradient_button.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/core/widget_lable_text.dart';
import 'package:kraya/core/widget_title_text.dart';
import 'package:kraya/model/bill.dart';
import 'package:kraya/ui/widgets/confirm_property/widget_cofirm_propert_bills_card.dart';
import 'package:kraya/ui/widgets/confirm_property/widget_confirm_property_rent_menu_card.dart';

class ConfirmPropertyScreen extends StatefulWidget {
  late List<Bill> billsList = [];

  ConfirmPropertyScreen({super.key, required this.billsList});

  @override
  State<ConfirmPropertyScreen> createState() => _ConfirmPropertyScreenState();
}

class _ConfirmPropertyScreenState extends State<ConfirmPropertyScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(firstWord: "Confirm", lastWord: "Property"),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: ColorSystem.instance.card),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                const SizedBox(height: 16),
                const WidgetTitleText(
                  text: 'B3-302 Flat A1',
                ),
                const SizedBox(height: 4),
                WidgetLabelText(
                  text: "340 E main St.Hazard,KY",
                  colorSystem: ColorSystem.instance.hint,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: ColorSystem.instance.primary,
                      label: WidgetLabelText(
                        text: "3 bedroom",
                        colorSystem: ColorSystem.instance.background,
                      ),
                      avatar: Icon(
                        Icons.bed,
                        color: ColorSystem.instance.background,
                      ),
                    ),
                    Chip(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: ColorSystem.instance.primary,
                      label: WidgetLabelText(
                        text: "2 bathroom",
                        colorSystem: ColorSystem.instance.background,
                      ),
                      avatar: Icon(
                        Icons.bathroom_outlined,
                        color: ColorSystem.instance.background,
                      ),
                    ),
                    Chip(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: ColorSystem.instance.primary,
                      label: WidgetLabelText(
                        text: "2 balcony",
                        colorSystem: ColorSystem.instance.background,
                      ),
                      avatar: Icon(
                        Icons.balcony,
                        color: ColorSystem.instance.background,
                      ),
                    ),
                    Chip(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: ColorSystem.instance.primary,
                      label: WidgetLabelText(
                        text: "2500 sq.ft",
                        colorSystem: ColorSystem.instance.background,
                      ),
                      avatar: Icon(
                        Icons.photo_size_select_large,
                        color: ColorSystem.instance.background,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                WidgetLabelText(text: "Rent", colorSystem: ColorSystem.instance.text),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        flex: 1,
                        child: WidgetConfirmPropertyRentMenuCard(
                          text: 'Monthly rent',
                          iconData: Icons.ac_unit,
                          onTap: () {},
                          amount: 1200,
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                        flex: 1,
                        child: WidgetConfirmPropertyRentMenuCard(
                          text: 'Advance amount',
                          iconData: Icons.ac_unit,
                          onTap: () {},
                          amount: 2344,
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                WidgetLabelText(text: "Bills", colorSystem: ColorSystem.instance.text),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.builder(
                    itemCount: widget.billsList.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemBuilder: (_, index) {
                      final Bill bill = widget.billsList[index];
                      return WidgetConfirmPropertyBillsCard(
                        text: bill.billName,
                        iconData: Icons.electric_bolt,
                        onTap: () {},
                        amount: bill.amount,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PhysicalModel(
              color: ColorSystem.instance.card,
              borderRadius: BorderRadius.circular(8),
              elevation: 5,
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.comfortable,
                leading:  Icon(Icons.person,color: ColorSystem.instance.primary,),
                title: Text(
                  "Add varatia profile",
                  style: TextSystem.instance.normal(ColorSystem.instance.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height:16),
          GradientButton(
            onPressed: () {},
            text: "Done",
          ),
        ],
      ),
    );
  }
}
