import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/regex_validator.dart';
import '../../../../../core/router.dart';
import '../../../../../core/task_notifier.dart';
import '../../../../../core/text_style.dart';
import '../../../../../core/widget/gradient_button.dart';
import '../../logic/generate_otp_bloc.dart';

class WidgetLoginForm extends StatefulWidget {
  const WidgetLoginForm({Key? key}) : super(key: key);

  @override
  State<WidgetLoginForm> createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

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
            showCursor: true,
            controller: controller,
            keyboardAppearance: Brightness.dark,
            autofocus: true,
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
          BlocConsumer<GenerateOtpBloc, GenerateOtpState>(
            listener: (_, state) {
              if (state is GenerateOtpAutoVerified) {
                context.goNamed(RouteNames.dashboard);
              } else if (state is GenerateOtpDone) {
                context.goNamed(
                  RouteNames.verifyOtp,
                  queryParameters: <String, String>{
                    "phone": controller.text,
                    "verification-id": state.verificationId,
                    "force-resending-token": state.forceResendingToken?.toString() ?? "",
                  },
                );
              }
            },
            builder: (_, state) {
              if (state is GenerateOtpLoading) {
                return GradientButton(
                  onPressed: () {},
                  text: "Please wait...",
                );
              } else if (state is GenerateOtpAutoVerified) {
                return GradientButton(
                  onPressed: () {},
                  text: "Logged in",
                );
              } else {
                return GradientButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (controller.text.length < 11) {
                        TaskNotifier.instance.warning(
                          context,
                          message: "Phone number must be 11 digit",
                        );
                      } else {
                        if (controller.text.contains("01")) {
                          context.read<GenerateOtpBloc>().add(
                                GenerateOtp(
                                  phone: controller.text,
                                ),
                              );
                        } else {
                          TaskNotifier.instance.warning(
                            context,
                            message: "Please use a valid phone number",
                          );
                        }
                      }
                    }
                  },
                  text: "Get OTP",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
