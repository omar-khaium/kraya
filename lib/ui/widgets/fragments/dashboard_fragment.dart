import 'package:flutter/material.dart';
import 'package:kraya/ui/widgets/dashboard/dashboard_custom_app_bar.dart';
import 'package:kraya/ui/widgets/dashboard/widget_dashboard_menu_card.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({Key? key}) : super(key: key);

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        child: Column(
          children:  [
            const DashboardCustomAppBar(firstWord: "Kraya", iconData: Icons.home),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            children: [
              WidgetDashboardMenuCard(text: 'Add property',iconData: Icons.add_business_rounded,onTap: (){},),
              WidgetDashboardMenuCard(text: 'Edit property',iconData: Icons.edit_location_alt_outlined,onTap: (){},),
              WidgetDashboardMenuCard(text: 'Appointment',iconData: Icons.calendar_month,onTap: (){},),
              WidgetDashboardMenuCard(text: 'Subscription',iconData: Icons.local_fire_department_sharp,onTap: (){},),
              WidgetDashboardMenuCard(text: 'Message',iconData: Icons.email_outlined,onTap: (){},),
              WidgetDashboardMenuCard(text: 'Bank',iconData: Icons.food_bank,onTap: (){},),
            ],)

          ],
        ),
      ),
    );
  }
}
