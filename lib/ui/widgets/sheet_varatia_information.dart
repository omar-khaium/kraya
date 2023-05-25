import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/gradient_button.dart';
import 'login/create_account/widget_input_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'login/create_account/widget_input_text_copy.dart';

class SheetVaratiaInformation extends StatefulWidget {
  final Function(String, String, String, String, String, String, String, String) onTap;

  const SheetVaratiaInformation({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SheetVaratiaInformation> createState() => _SheetVaratiaInformationState();
}

class _SheetVaratiaInformationState extends State<SheetVaratiaInformation> {
  final TextEditingController nidController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController fathersNameController = TextEditingController();
  final TextEditingController permanentController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

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
              "Add Varatia Information",
              style: TextSystem.instance.large(ColorSystem.instance.text),
            ),
          ),
          const SizedBox(height: 16),
          InputCopy(
            label: "Nid number",
            controller: nidController,
            icon: Icons.perm_identity,
            type: TextInputType.number,
            validator: (value) {
              nidController.text=value ?? "Invalid nid";
              return value;
            },
          ),
          const SizedBox(height: 8),
          Input(label: "Passport number", controller: passportController, icon: Icons.paste_sharp, type: TextInputType.text),
          const SizedBox(height: 8),
          Input(label: "Email", controller: emailController, icon: Icons.email_outlined, type: TextInputType.emailAddress),
          const SizedBox(height: 8),
          Input(label: "Religion", controller: religionController, icon: Icons.menu_book, type: TextInputType.text),
          const SizedBox(height: 8),
          Input(label: "Father's name", controller: fathersNameController, icon: Icons.person, type: TextInputType.text),
          const SizedBox(height: 8),
          Input(
              label: "Permanent address",
              controller: permanentController,
              icon: MdiIcons.locationEnter,
              type: TextInputType.text),
          const SizedBox(height: 8),
          Input(label: "Occupation", controller: occupationController, icon: Icons.work, type: TextInputType.text),
          const SizedBox(height: 8),
          Input(label: "Job address", controller: jobController, icon: Icons.tapas_sharp, type: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          GradientButton(
              onPressed: () {
                widget.onTap(nidController.text, passportController.text, emailController.text, religionController.text,
                    fathersNameController.text, permanentController.text, occupationController.text, jobController.text);
                if(nidController.text.isNotEmpty){
                  Navigator.of(context).pop();
                }
                else{
                  print("error-----------");
                }
              },
              text: "Submit")
        ],
      ),
    );
  }
}
