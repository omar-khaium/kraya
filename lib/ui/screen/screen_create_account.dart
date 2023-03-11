import 'package:flutter/material.dart';
import 'package:kraya/core/app_bar/custom_app_bar.dart';
import 'package:kraya/core/search_property.dart';
import 'package:kraya/ui/reusable_widgets/gradient_button.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_create_acc_date_of_birth.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_gender.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text.dart';

import '../../core/alert_property.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';

class CreateAccountScreen extends StatefulWidget {
  late bool fromVaratia;
   CreateAccountScreen({super.key,required this.fromVaratia});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        children: [
          const CustomAppBar(firstWord: "Create", lastWord: "Account", isBackButtonVisible: true),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: WidgetInput(
                          label: "First name",
                          controller: firstName,
                          icon: Icons.person_outline_rounded,
                          type: TextInputType.name,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: WidgetInput(
                          label: "Last name",
                          controller: lastName,
                          icon: Icons.person_outline_rounded,
                          type: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  WidgetInput(
                    label: "Email",
                    controller: email,
                    icon: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: const [
                      Expanded(child: WidgetDateOfBirth()),
                      SizedBox(width: 16),
                      Expanded(child: WidgetGender()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Profile picture", style: TextSystem.instance.small(ColorSystem.instance.hint)),
                  const SizedBox(height: 36),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 72,
                          backgroundColor: ColorSystem.instance.cardDeep,
                          child: const Icon(Icons.person,size: 64,),
                        ),
                        Positioned(
                            bottom: 8,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: ColorSystem.instance.primary,
                              child: const Icon(Icons.add),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
            child: GradientButton(
              hideIcon: false,
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
                  builder: (_) => widget.fromVaratia ? const AlertSearchProperty():const AlertAskForAddProperty(),
                );
              },
              text: "Done",
            ),
          ),
        ],
      ),
    );
  }
}
