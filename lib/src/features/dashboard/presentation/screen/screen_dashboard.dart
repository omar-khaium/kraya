import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/colors.dart';
import '../widget/dashboard_fragment.dart';
import '../widget/fragment_payment.dart';
import '../widget/fragment_profile.dart';
import '../widget/fragment_property.dart';
import '../widget/fragment_submit_bills.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation opacityTween;
  late Animation colorTween;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
    colorTween = ColorTween(begin: Colors.transparent, end: ColorSystem.instance.background).animate(_animationController);
    opacityTween = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollInfo) {
    bool scroll = false;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollInfo.metrics.pixels / 170);

      return scroll = true;
    }
    return scroll;
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorSystem.instance.background,
        body: [
          const FragmentDashboard(),
          const FragmentSubmitBills(),
          const FragmentProperty(),
          const FragmentPayment(),
          const FragmentProfile(),
        ].elementAt(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorSystem.instance.primary,
          unselectedItemColor: ColorSystem.instance.secondaryText,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(MdiIcons.ticketPercent), label: "Bill"),
            const BottomNavigationBarItem(icon: Icon(Icons.apartment), label: "Property"),
            const BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Payment"),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
