import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/custom_app_bar.dart';
import 'package:kraya/core/widget_counter.dart';
import 'package:kraya/core/widget_custom_menu_card.dart';
import 'package:kraya/core/widget_lable_text.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text.dart';

import '../core/colors.dart';
import '../core/gradient_button.dart';
import '../core/text_button.dart';
import '../core/text_style.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController propertySizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            firstWord: "Add",
            lastWord: "Property",
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WidgetLabelText(text: "Property type"),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: WidgetMenuCard(
                          text: "Residential",
                          iconData: Icons.home_outlined,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: WidgetMenuCard(
                          text: "Residential",
                          iconData: Icons.store_outlined,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const WidgetLabelText(text: "Select one"),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: WidgetMenuCard(
                          text: "Flat",
                          iconData: Icons.home_filled,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: WidgetMenuCard(
                          text: "Apartment",
                          iconData: Icons.apartment,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: WidgetMenuCard(
                          text: "Building",
                          iconData: Icons.warehouse_outlined,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  WidgetInput(
                      label: "Building name",
                      controller: buildingController,
                      icon: Icons.maps_home_work_outlined,
                      type: TextInputType.text),
                  const SizedBox(height: 16),
                  WidgetInput(
                      label: "Flat name",
                      controller: flatController,
                      icon: Icons.apartment,
                      type: TextInputType.text),
                  const SizedBox(height: 16),
                  WidgetInput(
                      label: "Address",
                      controller: flatController,
                      icon: Icons.location_on_outlined,
                      type: TextInputType.text),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: WidgetInput(label: "Property size", controller: propertySizeController, icon: Icons.numbers, type: TextInputType.number,

                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        flex: 2,
                        child: WidgetCounter(
                          text: "Room",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: WidgetCounter(
                          text: "Bathroom",
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: WidgetCounter(
                          text: "Bedroom",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GradientButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: ColorSystem.instance.background,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (_) => const AlertAskForAddProperty(),
                );
              },
              text: "Done",
            ),
          ),
        ],
      ),
    );
  }
}

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
                    onPressed: () {},
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
