import 'package:flutter/material.dart';
import 'package:kraya/core/custom_app_bar.dart';

import '../core/app_router.dart';
import '../core/colors.dart';
import '../core/gradient_button.dart';
import '../core/text_button.dart';
import '../core/text_style.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  _GenderSelection genderSelection = _GenderSelection.female;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        children: [
          const CustomAppBar(
            firstWord: "Add",
            lastWord: "Property",
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
                  const SizedBox(height: 24),
                  profilePicture(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GradientButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: ColorSystem.instance.background,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (_) => const AlertAskForAddProperty(),
                );
              },
              text: "Done",
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
          elevation: 1,
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
          elevation: 1,
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
          elevation: 1,
          color: ColorSystem.instance.card,
          shadowColor: ColorSystem.instance.cardDeep,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: PhysicalModel(
                    color: genderSelection == _GenderSelection.male ? ColorSystem.instance.primary : ColorSystem.instance.card,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          genderSelection = _GenderSelection.male;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
                        child: Row(
                          children: [
                            Icon(Icons.male_rounded,
                                color: genderSelection == _GenderSelection.male ? ColorSystem.instance.background : ColorSystem.instance.text,
                                size: 16),
                            Text(
                              "Male",
                              style: TextSystem.instance.small(
                                  genderSelection == _GenderSelection.male ? ColorSystem.instance.background : ColorSystem.instance.text),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PhysicalModel(
                    color: genderSelection == _GenderSelection.female ? ColorSystem.instance.primary : ColorSystem.instance.card,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          genderSelection = _GenderSelection.female;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
                        child: Row(
                          children: [
                            Icon(Icons.female_rounded,
                                color: genderSelection == _GenderSelection.female ? ColorSystem.instance.background : ColorSystem.instance.text,
                                size: 16),
                            Text(
                              "Female",
                              style: TextSystem.instance.small(
                                  genderSelection == _GenderSelection.female ? ColorSystem.instance.background : ColorSystem.instance.text),
                            )
                          ],
                        ),
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

  Widget profilePicture() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profile picture (optional)", style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: PhysicalModel(
                    elevation: 1,
                    color: ColorSystem.instance.card,
                    shadowColor: ColorSystem.instance.cardDeep,
                    borderRadius: BorderRadius.circular(100),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Center(
                        child: Icon(
                      Icons.person_rounded,
                      color: ColorSystem.instance.primary,
                      size: 100,
                    )),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: ColorSystem.instance.primary,
                    radius: 24,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: ColorSystem.instance.background,
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

class AlertAskForAddProperty extends StatelessWidget {
  const AlertAskForAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      color: ColorSystem.instance.background,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Would you like to",
              style: TextSystem.instance.small(ColorSystem.instance.hint),
            ),
            const SizedBox(height: 4),
            Text(
              "Add property?",
              style: TextSystem.instance.tooLarge(ColorSystem.instance.text),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AlternateButton(
                    onPressed: () {},
                    text: "Skip",
                    hideIcon: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: GradientButton(
                    onPressed: () {},
                    text: "Add property",
                    hideIcon: true,
                    smallText: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
