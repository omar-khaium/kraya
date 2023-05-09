import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kraya/model/drop_down_item.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/gradient_button.dart';
import 'dropdown/widget_dropdown.dart';
import 'login/create_account/widget_input_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SheetFamilyInformation extends StatefulWidget {
  final Function(String, String, String, String) onTap;

  const SheetFamilyInformation({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SheetFamilyInformation> createState() => _SheetFamilyInformationState();
}

class _SheetFamilyInformationState extends State<SheetFamilyInformation> {
  final TextEditingController nameController = TextEditingController(text: "test");

  final TextEditingController ageController = TextEditingController(text: "test");

  final TextEditingController occupationController = TextEditingController(text: "test");

  final List<DropDownItem> items = [
    DropDownItem(text: "Father", value: "father"),
    DropDownItem(text: "Mother", value: "mother"),
    DropDownItem(text: "Sister", value: "sister"),
    DropDownItem(text: "Brother", value: "brother"),
  ];

  String selectDropdown = "father";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Text(
              "Add Family Information",
              style: TextSystem.instance.large(ColorSystem.instance.text),
            ),
          ),
          WidgetInput(label: "Name", controller: nameController, icon: Icons.person_2_outlined, type: TextInputType.text),
          WidgetInput(label: "Age", controller: ageController, icon: MdiIcons.numeric0Box, type: TextInputType.text),
          WidgetInput(label: "Occupation", controller: occupationController, icon: Icons.work, type: TextInputType.text),
          DropDownMenu(
              shouldValidate: true,
              items: items.map((company) => DropDownItem(text: company.text, value: company.value.toString())).toList(),
              value: selectDropdown,
              onSelect: (value) {
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() async {
                  selectDropdown = value;
                });
              },
              title: 'Select Relationship',
              validationFlag: selectDropdown.isNotEmpty,
              text: selectDropdown.isEmpty ? "Select relationship" : items.firstWhereOrNull((element) => element.text.toLowerCase() == selectDropdown.toLowerCase())?.text),
          const SizedBox(
            height: 24,
          ),
          GradientButton(
              onPressed: () {
                widget.onTap(nameController.text,ageController.text,occupationController.text,selectDropdown);
                Navigator.of(context).pop();
              },
              text: "Submit")
        ],
      ),
    );
  }
}
