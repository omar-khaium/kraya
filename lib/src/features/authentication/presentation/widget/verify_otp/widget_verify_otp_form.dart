import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/router.dart';
import '../../../../../core/text_style.dart';
import '../../../../../core/widget/gradient_button.dart';
import '../../logic/verify_otp_bloc.dart';

class WidgetVerifyOtpForm extends StatefulWidget {
  final String phone;
  final String verificationId;
  final int? forceResendingToken;

  const WidgetVerifyOtpForm({
    super.key,
    required this.phone,
    required this.verificationId,
    this.forceResendingToken,
  });

  @override
  State<WidgetVerifyOtpForm> createState() => _WidgetVerifyOtpFormState();
}

class _WidgetVerifyOtpFormState extends State<WidgetVerifyOtpForm> {
  final pinController = TextEditingController();

  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 54,
    height: 54,
    textStyle: TextSystem.instance.veryLarge(ColorSystem.instance.text),
    decoration: BoxDecoration(
      color: ColorSystem.instance.cardDeep,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ColorSystem.instance.card),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "OTP sent to ${widget.phone}",
            style: TextSystem.instance.small(ColorSystem.instance.hint),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Pinput(
            controller: pinController,
            focusNode: focusNode,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            defaultPinTheme: defaultPinTheme,
            length: 6,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            validator: (value) {
              return value?.length == 6 ? null : 'Pin is incorrect';
            },

            // onClipboardFound: (value) {
            //   debugPrint('onClipboardFound: $value');
            //   pinController.setText(value);
            // },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: ColorSystem.instance.primary,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorSystem.instance.primary),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: ColorSystem.instance.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorSystem.instance.primary),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
          const SizedBox(height: 8),
          Divider(height: 1, thickness: .5, color: ColorSystem.instance.text),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
                text: "Didn't receive OTP? ",
                style: TextSystem.instance.small(ColorSystem.instance.hint),
                children: [TextSpan(text: "Resend OTP", style: TextSystem.instance.small(ColorSystem.instance.primary))]),
          ),
          const SizedBox(height: 16),
          BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
            listener: (context, state) {
              if (state is VerifyOtpDone) {
                context.goNamed(RouteNames.dashboard);
              }
            },
            builder: (context, state) {
              if (state is VerifyOtpLoading) {
                return GradientButton(
                  onPressed: () {},
                  text: "Please wait ...",
                );
              } else if (state is VerifyOtpDone) {
                return GradientButton(
                  onPressed: () {},
                  text: "Logged in",
                );
              } else {
                return GradientButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<VerifyOtpBloc>().add(
                            VerifyOtp(
                              verificationId: widget.verificationId,
                              code: pinController.text,
                            ),
                          );
                    }
                  },
                  text: "Verify",
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
