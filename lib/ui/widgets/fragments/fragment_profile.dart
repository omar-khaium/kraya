import 'package:flutter/material.dart';
import '../../../core/app_router.dart';
import '../../../core/colors.dart';
import '../../../core/text_style.dart';
import '../../reusable_widgets/widget_lable_text.dart';

import '../widget_profile_menus.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [ColorSystem.instance.gradientEnd, ColorSystem.instance.gradientStart],
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
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
            ),
            const SizedBox(height: 24),
            WidgetProfileMenu(
              onTap: () {},
              text: 'Get Subscription',
              icon: Icons.calendar_month,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {},
              text: 'All Documents',
              icon: Icons.file_present,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {},
              text: 'Reports',
              icon: Icons.report_outlined,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {},
              text: 'Notifications',
              icon: Icons.notifications_active_outlined,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {},
              text: 'Messages',
              icon: Icons.chat_bubble_outline,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.addBankAccount);
              },
              text: 'Add Bank Account',
              icon: Icons.food_bank_outlined,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.contactUs);
              },
              text: 'Contact Us',
              icon: Icons.call,
            ),
            Divider(
              thickness: 1,
              color: ColorSystem.instance.cardDeep,
            ),
            WidgetProfileMenu(
              onTap: () {},
              text: 'Log Out',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
