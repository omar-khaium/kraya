import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kraya/model/drop_down_item.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/gradient_button.dart';
import 'dropdown/widget_dropdown.dart';
import 'login/create_account/widget_input_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SheetEmergencyContact extends StatefulWidget {
  final Function(String, String, String, String) onTap;

  const SheetEmergencyContact({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SheetEmergencyContact> createState() => _SheetEmergencyContactState();
}

class _SheetEmergencyContactState extends State<SheetEmergencyContact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Add Emergency Contact",
              style: TextSystem.instance.large(ColorSystem.instance.text),
            ),
          ),
          const SizedBox(height:16),
          Input(label: "Name", controller: nameController, icon: Icons.person_2_outlined, type: TextInputType.text),
          const SizedBox(height:8),
          Input(label: "Address", controller: addressController, icon: MdiIcons.locationEnter, type: TextInputType.text),
          const SizedBox(height:8),
          Input(label: "Religion", controller: religionController, icon: Icons.family_restroom, type: TextInputType.text),
          const SizedBox(height:8),
          Input(label: "Contact number", controller: contactNumberController, icon: Icons.phone, type: TextInputType.phone),
           const SizedBox(
            height: 24,
          ),
          GradientButton(
              onPressed: () {
                widget.onTap(nameController.text, addressController.text, religionController.text, contactNumberController.text);
                Navigator.of(context).pop();
              },
              text: "Submit")
        ],
      ),
    );
  }
}
