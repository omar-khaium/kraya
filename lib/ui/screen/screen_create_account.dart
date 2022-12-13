import 'package:flutter/material.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_create_acc_date_of_birth.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text.dart';
import 'package:kraya/ui/widgets/login/verify_otp/widget_back_button.dart';

import '../../core/app_router.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  _GenderSelection genderSelection = _GenderSelection.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WidgetBackButton(route: AppRouter.newUserTypeSelectionScreen),
                RichText(
                  text: TextSpan(
                    text: "Create ",
                    style: TextSystem.instance.tooLarge(ColorSystem.instance.text),
                    children: [
                      TextSpan(text: "account", style: TextSystem.instance.tooLarge(ColorSystem.instance.primary)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: WidgetInputText(
                          label: "First name",
                          controller: firstName,
                          icon: Icons.person_outline_rounded,
                          type: TextInputType.name,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: WidgetInputText(
                          label: "Last name",
                          controller: lastName,
                          icon: Icons.person_outline_rounded,
                          type: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  WidgetInputText(
                    label: "Email",
                    controller: email,
                    icon: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Expanded(child: WidgetDateOfBirth()),
                      const SizedBox(width: 16),
                      Expanded(child: gender()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gender() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 4,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: PhysicalModel(
                    color: genderSelection == _GenderSelection.male ? ColorSystem.instance.primary : ColorSystem.instance.card,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Icon(Icons.male_rounded, color: ColorSystem.instance.text, size: 16),
                          Text(
                            "Male",
                            style: TextSystem.instance.small(ColorSystem.instance.text),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PhysicalModel(
                    color: genderSelection == _GenderSelection.female ? ColorSystem.instance.primary : ColorSystem.instance.card,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Icon(Icons.female_rounded, color: ColorSystem.instance.text, size: 16),
                          Text(
                            "Female",
                            style: TextSystem.instance.small(ColorSystem.instance.text),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}

enum _GenderSelection { none, male, female }
