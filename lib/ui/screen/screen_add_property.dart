import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/custom_app_bar.dart';
import 'package:kraya/core/enums.dart';
import 'package:kraya/core/gradient_button.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/ui/widgets/login/verify_otp/widget_back_button.dart';
import 'package:kraya/ui/widgets/login/widget_language_toggle.dart';
import 'package:kraya/ui/widgets/login/widget_login_form.dart';
import 'package:kraya/ui/widgets/login/widget_login_gradient.dart';
import 'package:kraya/ui/widgets/login/widget_login_greetings.dart';


class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children:  const [
          CustomAppBar(firstWord: "Add", lastWord: "Property")
        ],
      ),
    );
  }
}
