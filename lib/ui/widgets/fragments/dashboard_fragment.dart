import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/text_style.dart';
import '../../reusable_widgets/widget_lable_text.dart';
import '../dashboard/dashboard_custom_app_bar.dart';
import '../dashboard/widget_dashboard_menu_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../dashboard/widget_dashboard_pay_bill_card.dart';

class FragmentDashboard extends StatefulWidget {
  const FragmentDashboard({Key? key}) : super(key: key);

  @override
  State<FragmentDashboard> createState() => _FragmentDashboardState();
}

class _FragmentDashboardState extends State<FragmentDashboard> {
  List<String> items = [
    "https://img.freepik.com/premium-vector/special-offer-sale-discount-banner_180786-46.jpg?w=2000",
    "https://www.crushpixel.com/big-static13/preview4/special-offer-sale-fire-burn-1250537.jpg"
  ];

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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardCustomAppBar(firstWord: "Kraya", iconData: Icons.home),
            const SizedBox(height: 16),
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
                WidgetDashboardMenuCard(
                  text: 'Add property',
                  iconData: Icons.add_business_rounded,
                  onTap: () {},
                ),
                WidgetDashboardMenuCard(
                  text: 'Edit property',
                  iconData: Icons.edit_location_alt_outlined,
                  onTap: () {},
                ),
                WidgetDashboardMenuCard(
                  text: 'Appointment',
                  iconData: Icons.calendar_month,
                  onTap: () {},
                ),
                WidgetDashboardMenuCard(
                  text: 'Subscription',
                  iconData: Icons.local_fire_department_sharp,
                  onTap: () {},
                ),
                WidgetDashboardMenuCard(
                  text: 'Message',
                  iconData: Icons.email_outlined,
                  onTap: () {},
                ),
                WidgetDashboardMenuCard(
                  text: 'Bank',
                  iconData: Icons.food_bank,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 128,
                aspectRatio: 1,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInCubic,
                enlargeCenterPage: true,
                enlargeFactor: 0.1,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: items[index],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Divider(),
            WidgetLabelText(text: "Finance", colorSystem: ColorSystem.instance.text),
            const SizedBox(height: 8),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              visualDensity: VisualDensity.compact,
              leading: Text("৳ 1,00,500",style: TextSystem.instance.veryLarge(ColorSystem.instance.text).copyWith(fontWeight: FontWeight.w900),),
              trailing: Text("Month : June",style: TextSystem.instance.small(ColorSystem.instance.text),),
            ),
            const Divider(),
            const SizedBox(height: 8),
            WidgetLabelText(text: "Total amount", colorSystem: ColorSystem.instance.text),
            const SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [ColorSystem.instance.gradientStart, ColorSystem.instance.gradientEnd],
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(MdiIcons.cashCheck,color: ColorSystem.instance.background,),
                      const SizedBox(height: 8),
                      WidgetLabelText(text: "Paid", colorSystem: ColorSystem.instance.background),
                      const SizedBox(height: 8),
                      WidgetLabelText(text: "৳ 90,000", colorSystem: ColorSystem.instance.background),
                    ],
                  ),
                  Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: ColorSystem.instance.background
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time_rounded,color: ColorSystem.instance.background,),
                      const SizedBox(height: 8),
                      WidgetLabelText(text: "Due", colorSystem: ColorSystem.instance.background),
                      const SizedBox(height: 8),
                      WidgetLabelText(text: "৳ 10,000", colorSystem: ColorSystem.instance.background),
                    ],
                  ),
                ],

              ),
            ),
            const SizedBox(height: 16),
            WidgetLabelText(text: "Pay bill", colorSystem: ColorSystem.instance.text),
            const SizedBox(height: 8),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              children: const [
                WidgetDashboardPayBillCard(text: 'Gas', iconData: Icons.local_fire_department,),
                WidgetDashboardPayBillCard(text: 'Electricity', iconData: Icons.electric_bolt,),
                WidgetDashboardPayBillCard(text: 'Phone', iconData: Icons.call,),
                WidgetDashboardPayBillCard(text: 'Water', iconData: Icons.water,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
