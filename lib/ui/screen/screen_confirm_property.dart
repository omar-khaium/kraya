import 'package:flutter/material.dart';
import '../../core/app_router.dart';
import '../../core/colors.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../reusable_widgets/gradient_button.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/widget_lable_text.dart';
import '../reusable_widgets/widget_title_text.dart';
import '../../model/bill.dart';
import '../widgets/confirm_property/widget_confirm_property_bills_card.dart';
import '../widgets/confirm_property/widget_confirm_property_rent_menu_card.dart';

class ConfirmPropertyScreen extends StatefulWidget {
  final List<Bill> billsList;

  const ConfirmPropertyScreen({super.key, required this.billsList});

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
          const CustomAppBar(
            firstWord: "Confirm",
            lastWord: "Property",
            isBackButtonVisible: true,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorSystem.instance.card),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                const SizedBox(height: 16),
                WidgetTitleText(
                  text: 'B3-302 Flat A1',
                  colorSystem: ColorSystem.instance.text,
                ),
                const SizedBox(height: 4),
                CustomText(
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
                      label: CustomText(
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
                      label: CustomText(
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
                      label: CustomText(
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
                      label: CustomText(
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
                CustomText(text: "Rent", colorSystem: ColorSystem.instance.text),
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
                CustomText(text: "Bills", colorSystem: ColorSystem.instance.text),
                const SizedBox(height: 8),
                Expanded(
                  child: widget.billsList.isEmpty
                      ? Center(
                          child: CustomText(
                            text: "No bills added",
                            colorSystem: ColorSystem.instance.text,
                          ),
                        )
                      : GridView.builder(
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
                )
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
                leading: Icon(
                  Icons.person,
                  color: ColorSystem.instance.primary,
                ),
                title: Text(
                  "Add varatia profile",
                  style: TextSystem.instance.normal(ColorSystem.instance.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          GradientButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRouter.dashboard);
            },
            text: "Done",
          ),
        ],
      ),
    );
  }
}
