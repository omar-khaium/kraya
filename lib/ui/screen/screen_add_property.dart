import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text_copy.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../../core/app_router.dart';
import '../../core/enums.dart';
import '../../core/helper.dart';
import '../../core/widget_counter.dart';
import '../reusable_widgets/widget_lable_text.dart';
import '../reusable_widgets/widget_selection_card.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/gradient_button.dart';
import '../widgets/singleton_task_notifier.dart';

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
  final TextEditingController descriptionController = TextEditingController();

  PropertySelection propertySelection = PropertySelection.none;
  BuildingTypeSelection buildingTypeSelection = BuildingTypeSelection.none;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String file = "";
  List<File> files = [];
  final ImagePicker pickedFile = ImagePicker();
  bool isLoading = true;
  DateTime selectedMonth = DateTime.now();

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
            isBackButtonVisible: true,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Property type",
                      colorSystem: ColorSystem.instance.hint,
                    ),
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
                    CustomText(
                      text: "Select one",
                      colorSystem: ColorSystem.instance.hint,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: WidgetCardSelection(
                            label: "Flat",
                            icon: Icons.other_houses_outlined,
                            selected: buildingTypeSelection == BuildingTypeSelection.flat,
                            onTap: () {
                              setState(() {
                                buildingTypeSelection = BuildingTypeSelection.flat;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: WidgetCardSelection(
                            label: "Apartment",
                            icon: Icons.home_work_outlined,
                            selected: buildingTypeSelection == BuildingTypeSelection.apartment,
                            onTap: () {
                              setState(() {
                                buildingTypeSelection = BuildingTypeSelection.apartment;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: WidgetCardSelection(
                            label: "Building",
                            icon: Icons.apartment_outlined,
                            selected: buildingTypeSelection == BuildingTypeSelection.building,
                            onTap: () {
                              setState(() {
                                buildingTypeSelection = BuildingTypeSelection.building;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    InputCopy(
                      label: "Building name",
                      controller: buildingController,
                      icon: Icons.maps_home_work_outlined,
                      type: TextInputType.text,
                      validator: (buildingName) {
                        if (buildingName == null) {
                          return "Invalid building name";
                        }
                        return buildingName.isEmpty ? " *Required" : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputCopy(
                      label: "Flat name",
                      controller: flatController,
                      icon: Icons.apartment,
                      type: TextInputType.text,
                      validator: (flatName) {
                        if (flatName == null) {
                          return "Invalid flat name";
                        }
                        return flatName.isEmpty ? " *Required" : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputCopy(
                      label: "Address",
                      controller: flatController,
                      icon: Icons.location_on_outlined,
                      type: TextInputType.text,
                      validator: (address) {
                        if (address == null) {
                          return "Invalid address";
                        }
                        return address.isEmpty ? " *Required" : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InputCopy(
                            label: "Property size",
                            controller: propertySizeController,
                            icon: Icons.numbers,
                            type: TextInputType.number,
                            validator: (propertySize) {
                              if (propertySize == null) {
                                return "Invalid property size";
                              }
                              return propertySize.isEmpty ? " *Required" : null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: WidgetCounter(
                            text: "Room",
                            onTap: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: WidgetCounter(
                            text: "Bathroom",
                            onTap: (value) {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: WidgetCounter(
                            text: "Bedroom",
                            onTap: (value) {},
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
                      child: TextField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Picture(optional)", style: TextSystem.instance.small(ColorSystem.instance.hint)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Visibility(
                        visible: files.isNotEmpty,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 144,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => isLoading
                                ? const CircularProgressIndicator()
                                : Container(
                                    width: 144,
                                    height: 144,
                                    margin: const EdgeInsets.all(4),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Image.file(files[index], fit: BoxFit.cover, width: 144, height: 144),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(color: ColorSystem.instance.card, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8))),
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.delete, color: ColorSystem.instance.error),
                                              visualDensity: VisualDensity.compact,
                                              splashRadius: 12,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (deleteContext) => AlertDialog(
                                                    title: Text(
                                                      "Confirmation",
                                                      style: TextSystem.instance.normal(
                                                        ColorSystem.instance.text,
                                                      ),
                                                    ),
                                                    content: Text(
                                                      "Are you sure?",
                                                      style: TextSystem.instance.small(
                                                        ColorSystem.instance.text,
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(deleteContext).pop();
                                                        },
                                                        style: TextButton.styleFrom(
                                                          foregroundColor: ColorSystem.instance.card,
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(color: ColorSystem.instance.text, width: 1),
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextSystem.instance.small(
                                                            ColorSystem.instance.error,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          Navigator.of(deleteContext).pop();
                                                          setState(() {
                                                            files.removeAt(index);
                                                          });
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: ColorSystem.instance.error,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                        ),
                                                        child: Text("Yes, Delete",
                                                            style: TextSystem.instance.small(
                                                              ColorSystem.instance.background,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            itemCount: files.length,
                          ),
                        )),
                    const SizedBox(height: 16),
                    GradientButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: ColorSystem.instance.secondaryText,
                          backgroundColor: ColorSystem.instance.background,
                          builder: (builderContext) => Container(
                            decoration: BoxDecoration(color: ColorSystem.instance.card),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Choose an option",
                                      style: TextSystem.instance.normal(ColorSystem.instance.gradientStart),
                                    ),
                                  ),
                                  const Divider(),
                                  ListTile(
                                    leading: Icon(Icons.camera_enhance_outlined, color: ColorSystem.instance.text),
                                    title: Text(
                                      "Camera",
                                      style: TextSystem.instance.normal(ColorSystem.instance.text),
                                    ),
                                    onTap: () async {
                                      if (await Helper().askForPermission(ImageSource.camera)) {
                                        final XFile? path = await pickedFile.pickImage(source: ImageSource.camera);
                                        if (path != null) {
                                          setState(() {
                                            files.add(File(path.path));
                                            isLoading = false;
                                          });
                                        }
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                        }
                                      }
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.wallpaper_outlined, color: ColorSystem.instance.text),
                                    title: Text(
                                      "Gallery",
                                      style: TextSystem.instance.normal(ColorSystem.instance.gradientStart),
                                    ),
                                    onTap: () async {
                                      if (await Helper().askForPermission(ImageSource.gallery)) {
                                        final XFile? path = await pickedFile.pickImage(source: ImageSource.gallery);
                                        if (path != null) {
                                          setState(() {
                                            files.add(File(path.path));
                                            isLoading = false;
                                          });
                                        }
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                        }
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      text: "Upload",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InputCopy(
                            label: "Advance amount",
                            controller: advanceRentController,
                            icon: Icons.money,
                            type: TextInputType.number,
                            validator: (advance) {
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: InputCopy(
                            label: "Monthly amount",
                            controller: monthlyRentController,
                            icon: Icons.casino_sharp,
                            type: TextInputType.number,
                            validator: (monthly) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available from",
                          style: TextSystem.instance.small(ColorSystem.instance.hint),
                        ),
                        CupertinoSwitch(value: true, onChanged: (v) {})
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(context: context, initialDate: selectedMonth, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
                              if (picked != null && picked != selectedMonth) {
                                setState(() {
                                  selectedMonth = picked;
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 48,
                              decoration: BoxDecoration(
                                color: ColorSystem.instance.card,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                DateFormat("MMMM").format(selectedMonth),
                                style: TextSystem.instance.small(ColorSystem.instance.text),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 48,
                              decoration: BoxDecoration(
                                color: ColorSystem.instance.card,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                DateFormat("yyyy").format(selectedMonth),
                                style: TextSystem.instance.small(ColorSystem.instance.text),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GradientButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.of(context).pushReplacementNamed(AppRouter.utilityBills);
                } else {
                  TaskNotifier.instance.warning(
                    context,
                    message: "Please complete the form",
                  );
                }
              },
              text: "Done",
            ),
          ),
        ],
      ),
    );
  }
}
