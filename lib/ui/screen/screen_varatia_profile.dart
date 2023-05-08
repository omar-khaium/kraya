import 'package:flutter/material.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/widget_lable_text.dart';

class VaratiaProfileScreen extends StatefulWidget {
  const VaratiaProfileScreen({
    super.key,
  });

  @override
  State<VaratiaProfileScreen> createState() => _VaratiaProfileScreenState();
}

class _VaratiaProfileScreenState extends State<VaratiaProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        children: [
          const CustomAppBar(firstWord: "", lastWord: "Account", isBackButtonVisible: true),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                dense: true,
                visualDensity: VisualDensity.comfortable,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                leading: CircleAvatar(
                  backgroundColor: ColorSystem.instance.background,
                  child: ClipOval(child: Image.network("https://www.shutterstock.com/image-vector/grunge-rubber-stamp-text-custom-260nw-167690960.jpg")),
                ),
                title: Text(
                  "John doe",
                  style: TextSystem.instance.extraLarge(ColorSystem.instance.background),
                ),
                subtitle: Text(
                  "Owner",
                  style: TextSystem.instance.small(ColorSystem.instance.background),
                ),
                trailing: ActionChip(
                  disabledColor: ColorSystem.instance.background,
                  label: WidgetLabelText(
                    text: 'Edit',
                    colorSystem: ColorSystem.instance.text,
                  ),
                ),
              ),
            ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
