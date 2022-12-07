import 'package:flutter/material.dart';

import '../core/app_router.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

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
                backButton(),
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
                        child: input(
                          label: "First name",
                          controller: firstName,
                          icon: Icons.person_outline_rounded,
                          type: TextInputType.name,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: input(
                          label: "Last name",
                          controller: lastName,
                          icon: Icons.person_outline_rounded,
                          type: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  input(
                    label: "Email",
                    controller: email,
                    icon: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: dateOfBirth()),
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

  Widget input({required String label, required TextEditingController controller, required IconData icon, required TextInputType type}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 4,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextField(
            controller: controller,
            keyboardType: type,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: ColorSystem.instance.primary),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget dateOfBirth() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date of birth", style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        PhysicalModel(
          elevation: 4,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time_rounded, color: ColorSystem.instance.primary),
                const SizedBox(width: 12),
                Text("Date of birth", style: TextSystem.instance.normal(ColorSystem.instance.text)),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ],
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

  Widget backButton() {
    return IconButton(
      iconSize: 48,
      splashRadius: 28,
      splashColor: ColorSystem.instance.cardDeep,
      onPressed: () => Navigator.of(context).pushReplacementNamed(AppRouter.newUserTypeSelectionScreen),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      padding: EdgeInsets.zero,
      icon: CircleAvatar(
        radius: 24,
        backgroundColor: ColorSystem.instance.primary,
        child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      ),
    );
  }
}

enum _GenderSelection { none, male, female }
