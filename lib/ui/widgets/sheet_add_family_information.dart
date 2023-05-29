import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kraya/model/drop_down_item.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text_copy.dart';
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
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController occupationController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Add Family Information",
                style: TextSystem.instance.large(ColorSystem.instance.text),
              ),
            ),
            const SizedBox(height: 16),
            InputCopy(
              label: "Name",
              controller: nameController,
              icon: Icons.person_2_outlined,
              type: TextInputType.text,
              validator: (name) {
                if (name == null) {
                  return "Invalid name";
                }
                return name.isEmpty ? " *Name is Required" : null;
              },
            ),
            const SizedBox(height: 8),
            InputCopy(
              label: "Age",
              controller: ageController,
              icon: MdiIcons.numeric0Box,
              type: TextInputType.number,
              validator: (age) {
                if (age == null) {
                  return "Invalid age";
                }
                return age.isEmpty ? " *Name is Required" : null;
              },
            ),
            const SizedBox(height: 8),
            InputCopy(
              label: "Occupation",
              controller: occupationController,
              icon: Icons.work,
              type: TextInputType.text,
              validator: (occupation) {
                if (occupation == null) {
                  return "Invalid occupation";
                }
                return occupation.isEmpty ? " *Occupation is Required" : null;
              },
            ),
            const SizedBox(height: 16),
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
                text: selectDropdown.isEmpty
                    ? "Select relationship"
                    : items.firstWhereOrNull((element) => element.text.toLowerCase() == selectDropdown.toLowerCase())?.text),
            const SizedBox(
              height: 24,
            ),
            GradientButton(
                onPressed: () {
                  if(formKey.currentState?.validate() ??false && selectDropdown.isNotEmpty){
                    Navigator.of(context).pop();
                  }
                },
                text: "Submit")
          ],
        ),
      ),
    );
  }
}
