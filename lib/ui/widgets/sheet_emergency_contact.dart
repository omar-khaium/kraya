
import 'package:flutter/material.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text_copy.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/gradient_button.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                "Add Emergency Contact",
                style: TextSystem.instance.large(ColorSystem.instance.text),
              ),
            ),
            const SizedBox(height:16),
            InputCopy(label: "Name", controller: nameController, icon: Icons.person_2_outlined, type: TextInputType.text,
              validator: (name) {
                if (name == null) {
                  return "Invalid name";
                }
                return name.isEmpty ? " *Name is Required" : null;
              },
            ),
            const SizedBox(height:8),
            InputCopy(label: "Address", controller: addressController, icon: MdiIcons.locationEnter, type: TextInputType.text,
                validator: (address) {
                  if (address == null) {
                    return "Invalid address";
                  }
                  return address.isEmpty ? " *Address is Required" : null;
                }),
            const SizedBox(height:8),
            InputCopy(label: "Religion", controller: religionController, icon: Icons.family_restroom, type: TextInputType.text,
                validator: (religion) {
                  if (religion == null) {
                    return "Invalid Religion";
                  }
                  return religion.isEmpty ? " *Religion is Required" : null;
                }),
            const SizedBox(height:8),
            InputCopy(label: "Contact number", controller: contactNumberController, icon: Icons.phone, type: TextInputType.phone,
                validator: (contact) {
                  if (contact == null) {
                    return "Invalid Contact";
                  }
                  return contact.isEmpty ? " *Contact is Required" : null;
                }),
             const SizedBox(
              height: 24,
            ),
            GradientButton(
                onPressed: () {
                  if(formKey.currentState?.validate() ??false) {
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
