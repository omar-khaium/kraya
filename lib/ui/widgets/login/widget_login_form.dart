import 'package:flutter/material.dart';
import '../../../core/app_router.dart';
import '../../../core/colors.dart';
import '../../../core/regex_validator.dart';
import '../../reusable_widgets/gradient_button.dart';
import '../../../core/text_style.dart';
import '../singleton_task_notifier.dart';

class WidgetLoginForm extends StatefulWidget {
  const WidgetLoginForm({Key? key}) : super(key: key);

  @override
  State<WidgetLoginForm> createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController(text: "01737935210");
  FocusNode currentFocus = FocusNode();
  @override
  void initState() {
    currentFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: controller,
            focusNode: currentFocus.parent,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              return (val ?? "").isNotEmpty
                  ? RegexValidator.phone(val ?? "")
                      ? null
                      : ""
                  : "* required";
            },
            maxLength: 11,
            decoration: InputDecoration(
                labelText: "Enter mobile number",
                labelStyle: TextSystem.instance.small(ColorSystem.instance.hint),
                focusedBorder: const UnderlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(),
                border: const UnderlineInputBorder(),
                contentPadding: EdgeInsets.zero),
          ),
          const SizedBox(height: 8),
          Text(
            "We will send you one time password (OTP)",
            style: TextSystem.instance.verySmall(ColorSystem.instance.hint),
          ),
          const SizedBox(height: 32),
          GradientButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                if (controller.text.length < 11) {
                  TaskNotifier.instance.warning(
                    context,
                    message: "Phone number must be 11 digit",
                  );
                } else {
                  if (controller.text.contains("01")) {
                    Navigator.of(context).pushReplacementNamed(AppRouter.otpVerification, arguments: controller.text);
                  } else {
                    TaskNotifier.instance.warning(
                      context,
                      message: "Please use a valid phone number",
                    );
                  }
                }
              }
              //Navigator.of(context).pushReplacementNamed(AppRouter.dashboard);
            },
            text: "Get OTP",
          ),
        ],
      ),
    );
  }
}
