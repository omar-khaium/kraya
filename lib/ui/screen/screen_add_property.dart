import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/custom_app_bar.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/widget_counter.dart';
import 'package:kraya/core/widget_custom_menu_card.dart';
import 'package:kraya/core/widget_lable_text.dart';
import 'package:kraya/core/widget_selection_card.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text.dart';

import '../../core/colors.dart';
import '../../core/gradient_button.dart';
import '../../core/text_button.dart';
import '../../core/text_style.dart';

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
  final TextEditingController advanceRentController = TextEditingController();
  final TextEditingController monthlyRentController = TextEditingController();

  PropertySelection propertySelection = PropertySelection.none;
  BuildingTypeSelection buildingTypeSelection = BuildingTypeSelection.none;

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
                        child: WidgetCardSelection(
                          label: "Residential",
                          icon: Icons.apartment_rounded,
                          selected: propertySelection == PropertySelection.residential,
                          onTap: () {
                            setState(() {
                              propertySelection = PropertySelection.residential;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: WidgetCardSelection(
                          label: "Commercial",
                          icon: Icons.store_outlined,
                          selected: propertySelection == PropertySelection.commercial,
                          onTap: () {
                            setState(() {
                              propertySelection = PropertySelection.commercial;
                            });
                          },
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
                        child: WidgetCardSelection(
                          label: "Flat",
                          icon: Icons.home_filled,
                          selected: buildingTypeSelection==BuildingTypeSelection.flat,
                          onTap: () {
                            setState(() {
                              buildingTypeSelection=BuildingTypeSelection.flat;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: WidgetCardSelection(
                          label: "Apartment",
                          icon: Icons.home_filled,
                          selected: buildingTypeSelection==BuildingTypeSelection.apartment,
                          onTap: () {
                            setState(() {
                              buildingTypeSelection=BuildingTypeSelection.apartment;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: WidgetCardSelection(
                          label: "Building",
                          icon: Icons.warehouse_outlined,
                          selected: buildingTypeSelection==BuildingTypeSelection.building,
                          onTap: () {
                            setState(() {
                              buildingTypeSelection=BuildingTypeSelection.building;
                            });
                          },
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
                  WidgetInput(label: "Flat name", controller: flatController, icon: Icons.apartment, type: TextInputType.text),
                  const SizedBox(height: 16),
                  WidgetInput(
                      label: "Address", controller: flatController, icon: Icons.location_on_outlined, type: TextInputType.text),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: WidgetInput(
                          label: "Property size",
                          controller: propertySizeController,
                          icon: Icons.numbers,
                          type: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 12),
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
                      SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: WidgetCounter(
                          text: "Bedroom",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Description", style: TextSystem.instance.small(ColorSystem.instance.hint)),
                  const SizedBox(height: 4),
                  PhysicalModel(
                    elevation: 2,
                    color: ColorSystem.instance.card,
                    shadowColor: ColorSystem.instance.cardDeep,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text("Picture(optional)", style: TextSystem.instance.small(ColorSystem.instance.hint)),
                  const SizedBox(height: 4),
                  GradientButton(
                    onPressed: () {},
                    text: "Upload",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: WidgetInput(
                            label: "Advance amount",
                            controller: advanceRentController,
                            icon: Icons.money,
                            type: TextInputType.text),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: WidgetInput(
                            label: "Monthly amount",
                            controller: monthlyRentController,
                            icon: Icons.casino_sharp,
                            type: TextInputType.text),
                      ),
                    ],
                  ),

                  //TODO-----Image upload+date picker
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GradientButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppRouter.utilityBills);
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
