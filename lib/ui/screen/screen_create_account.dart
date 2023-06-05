import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kraya/ui/widgets/login/create_account/widget_input_text_copy.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../../core/search_property.dart';
import '../reusable_widgets/gradient_button.dart';
import '../widgets/login/create_account/widget_create_acc_date_of_birth.dart';
import '../widgets/login/create_account/widget_gender.dart';

import '../../core/alert_property.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../widgets/singleton_task_notifier.dart';
import '../widgets/widget_upload_options.dart';

class CreateAccountScreen extends StatefulWidget {
  final bool fromVaratia;
  const CreateAccountScreen({super.key, required this.fromVaratia});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  late String file = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Form(
        key: formKey,
        child: Column(
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
                          child: InputCopy(
                            label: "First name",
                            controller: firstName,
                            icon: Icons.person_outline_rounded,
                            type: TextInputType.name,
                              validator: (firstName) {
                                if (firstName == null) {
                                  return "Invalid first name";
                                }
                                return firstName.isEmpty ? " *First name address is Required" : null;
                              }
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InputCopy(
                            label: "Last name",
                            controller: lastName,
                            icon: Icons.person_outline_rounded,
                            type: TextInputType.name,
                              validator: (lastName) {
                                if (lastName == null) {
                                  return "Invalid last name";
                                }
                                return lastName.isEmpty ? " *Last name is Required" : null;
                              }
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    InputCopy(
                      label: "Email",
                      controller: email,
                      icon: Icons.email_outlined,
                      type: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null) {
                            return "Invalid email";
                          }
                          return email.isEmpty ? " *Email address is Required" : null;
                        }
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: ColorSystem.instance.secondaryText,
                          backgroundColor: ColorSystem.instance.background,
                          builder: (builderContext) => UploadOptionChooser(
                            guid: "",
                            onTap: (path) {
                              setState(() {
                                file = path;
                              });
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Stack(
                          children: [
                            file.isNotEmpty && file != ""
                                ? ClipOval(
                                    child: SizedBox.fromSize(
                                        size: const Size.fromRadius(72),
                                        child: Image.file(
                                          File(file),
                                          fit: BoxFit.cover,
                                        )))
                                : CircleAvatar(
                              backgroundColor: ColorSystem.instance.card,
                                  radius: 72,
                                  child:  const Icon(
                                      Icons.person,
                                      size: 64,
                                    ),
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: GradientButton(
                hideIcon: false,
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
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
                      builder: (_) => widget.fromVaratia ? const AlertSearchProperty() : const AlertAskForAddProperty(),
                    );
                  } else {
                    TaskNotifier.instance.warning(
                      context,
                      message: "Please fill up the form",
                    );
                  }
                },
                text: "Done",
              ),
            ),
          ],
        ),
      ),
    );
  }

}
