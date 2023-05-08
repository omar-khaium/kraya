import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/bottom_navigation/bottom_navigation_cubit.dart';
import '../../core/colors.dart';
import '../widgets/fragments/dashboard_fragment.dart';
import '../widgets/fragments/fragment_payment.dart';
import '../widgets/fragments/fragment_profile.dart';
import '../widgets/fragments/fragment_property.dart';
import '../widgets/fragments/fragment_submit_bills.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> with SingleTickerProviderStateMixin{
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorSystem.instance.background,
        body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (_, state) {
            return IndexedStack(
              index: state.index,
              children: const [
                FragmentDashboard(),
                FragmentSubmitBills(),
                FragmentProperty(),
                FragmentPayment(),
                FragmentProfile(),
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(builder: (_, state) {
          return BottomNavigationBar(
            selectedItemColor: ColorSystem.instance.primary,
            unselectedItemColor: ColorSystem.instance.secondaryText,
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            onTap: (int index) {
              BlocProvider.of<BottomNavigationCubit>(context).changePage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(MdiIcons.ticketPercent), label: "Bill"),
              BottomNavigationBarItem(icon: Icon(Icons.apartment), label: "Property"),
              BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Payment"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          );
        }),
      ),
    );
  }
}
