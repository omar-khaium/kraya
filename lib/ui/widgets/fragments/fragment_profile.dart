import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_bar/custom_app_bar.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FragmentProfile extends StatefulWidget {
  const FragmentProfile({Key? key}) : super(key: key);

  @override
  State<FragmentProfile> createState() => _FragmentProfileState();
}

class _FragmentProfileState extends State<FragmentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(firstWord: "Profile", lastWord: "",isBackButtonVisible: false,),
          ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: Icon(
              Icons.access_time_rounded,
              color: ColorSystem.instance.background,
              size: 36,
            ),
            title:Text(
              "Test",
              style: TextSystem.instance.extraLarge(ColorSystem.instance.background),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "John doe",
                      style: TextSystem.instance.normal(ColorSystem.instance.background),
                    ),
                    const SizedBox(height:4),
                    Text(
                      "Owner",
                      style: TextSystem.instance.small(ColorSystem.instance.background),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: ColorSystem.instance.background,
                  child: ClipOval(child: Image.network("https://www.shutterstock.com/image-vector/grunge-rubber-stamp-text-custom-260nw-167690960.jpg")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget billsItem() {
  return Expandable(
    collapsed: const Text(""),
    expanded: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (context, int index) {
        return ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: WidgetLabelText(
            text: "Bill",
            colorSystem: ColorSystem.instance.text,
          ),
          trailing: WidgetLabelText(
            text: "Amount",
            colorSystem: ColorSystem.instance.text,
          ),
        );
      },
    ),
  );
}
