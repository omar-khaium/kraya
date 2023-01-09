import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraya/business_logic/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/ui/widgets/fragments/dashboard_fragment.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _opacityTween, _colorTween;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: ColorSystem.instance.background).animate(_animationController);
    _opacityTween = Tween<double>(begin: 0, end: 1).animate(_animationController);
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
                DashboardFragment(),
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
