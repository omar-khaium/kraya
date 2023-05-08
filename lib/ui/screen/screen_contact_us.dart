import 'package:flutter/material.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../reusable_widgets/gradient_button.dart';
import '../reusable_widgets/widget_lable_text.dart';
import '../reusable_widgets/widget_title_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/colors.dart';
import '../widgets/login/create_account/widget_input_text.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController optionalPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(
                firstWord: "Add Bank", lastWord: "Account", isBackButtonVisible: true),
            const SizedBox(height: 24),
            WidgetInput(
              label: "Name",
              controller: nameController,
              icon: Icons.person_outline_rounded,
              type: TextInputType.name,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Phone",
              controller: phoneController,
              icon: MdiIcons.phone,
              type: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Address",
              controller: addressController,
              icon: Icons.location_on_outlined,
              type: TextInputType.name,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Optional phone",
              controller: optionalPhoneController,
              icon: MdiIcons.phone,
              type: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            WidgetInput(
              label: "Appointment date and time",
              controller: optionalPhoneController,
              icon: MdiIcons.calendar,
              type: TextInputType.name,
            ),
            const SizedBox(height: 16),
            Container(
              padding:const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                              color: ColorSystem.instance.card,
                borderRadius: BorderRadius.circular(8)
                            ),
              child:Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetLabelText(text: "Contact us", colorSystem: ColorSystem.instance.hint),
                  WidgetTitleText(text: "(606) 439-0566", colorSystem: ColorSystem.instance.text),
                  WidgetTitleText(text: "340 E Main st.", colorSystem: ColorSystem.instance.text),
                  WidgetTitleText(text: "Texas,USA", colorSystem: ColorSystem.instance.text),
                ],
              ),
            ),
            const SizedBox(height: 64),
            Align(
                alignment: Alignment.bottomCenter,
                child: GradientButton(onPressed: () {}, text: "Done".toUpperCase()))
          ],
        ),
      ),
    );
  }
}
