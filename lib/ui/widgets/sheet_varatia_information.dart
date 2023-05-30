import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/gradient_button.dart';
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
              validator: (nid) {
                if (nid == null) {
                  return "Invalid name";
                }
                return nid.isEmpty ? " *Nid is Required" : null;
              },
            ),
            const SizedBox(height: 8),
            InputCopy(label: "Passport number", controller: passportController, icon: Icons.paste_sharp, type: TextInputType.text,
              validator: (passport) {
                if (passport == null) {
                  return "Invalid passport";
                }
                return passport.isEmpty ? " *Passport is Required" : null;
              },),
            const SizedBox(height: 8),
            InputCopy(label: "Email", controller: emailController, icon: Icons.email_outlined, type: TextInputType.emailAddress,
              validator: (email) {
                if (email == null) {
                  return "Invalid email";
                }
                return email.isEmpty ? " *Email is Required" : null;
              },),
            const SizedBox(height: 8),
            InputCopy(label: "Religion", controller: religionController, icon: Icons.menu_book, type: TextInputType.text,
              validator: (religion) {
                if (religion == null) {
                  return "Invalid religion";
                }
                return religion.isEmpty ? " *Religion is Required" : null;
              },),
            const SizedBox(height: 8),
            InputCopy(label: "Father's name", controller: fathersNameController, icon: Icons.person, type: TextInputType.text,
              validator: (fName) {
                if (fName == null) {
                  return "Invalid Father's name";
                }
                return fName.isEmpty ? " *Father's name is Required" : null;
              },),
            const SizedBox(height: 8),
            InputCopy(
                label: "Permanent address",
                controller: permanentController,
                icon: MdiIcons.locationEnter,
                type: TextInputType.text,
                validator: (permanentAddress) {
                  if (permanentAddress == null) {
                    return "Invalid Permanent address";
                  }
                  return permanentAddress.isEmpty ? " *Father's name is Required" : null;
                }
            ),
            const SizedBox(height: 8),
            InputCopy(label: "Occupation", controller: occupationController, icon: Icons.work, type: TextInputType.text,
                validator: (occupation) {
                  if (occupation == null) {
                    return "Invalid occupation";
                  }
                  return occupation.isEmpty ? " *Occupation is Required" : null;
                }),
            const SizedBox(height: 8),
            InputCopy(label: "Job address", controller: jobController, icon: Icons.tapas_sharp, type: TextInputType.text,
                validator: (jobAddress) {
                  if (jobAddress == null) {
                    return "Invalid job address";
                  }
                  return jobAddress.isEmpty ? " *Job address is Required" : null;
                }),
            const SizedBox(
              height: 24,
            ),
            GradientButton(
                onPressed: () {
                  if(formKey.currentState?.validate() ?? false){
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
