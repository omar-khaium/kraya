import 'package:flutter/material.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../../core/app_router.dart';
import '../../core/colors.dart';
import '../reusable_widgets/widget_lable_text.dart';
import '../reusable_widgets/widget_title_text.dart';
import '../widgets/search_property/search_widget.dart';
import '../../model/bill.dart';
import '../widgets/widget_search_property_icon_text.dart';

class SearchPropertyScreen extends StatelessWidget {
  final List<Bill> billsList = [];

  SearchPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    billsList.add(Bill(billName: "Gas", amount: 2000));
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(
                firstWord: "Search",
                lastWord: "Property",
                isBackButtonVisible: true),
            const SizedBox(height: 24),
            SearchWidget(
              onTap: () {},
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (context, int index) {
                  return PhysicalModel(
                    color: ColorSystem.instance.card,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                            AppRouter.confirmProperty,
                            arguments: billsList);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  backgroundColor: ColorSystem.instance.primary,
                                  backgroundImage: const NetworkImage(
                                      'https://media.istockphoto.com/id/1291318636/photo/put-more-in-get-more-out.jpg?s=612x612&w=0&k=20&c=KRvn1x6r9x9GmYMLpW6AVZzkvOA0bmn14fKle-O6CVc='),
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WidgetTitleText(
                                        text: "John doe",
                                        colorSystem: ColorSystem.instance.text),
                                    const SizedBox(height: 8),
                                    const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        WidgetSearchIconText(
                                          iconData: Icons.bed_outlined,
                                          text: '3',
                                        ),
                                        SizedBox(width: 8),
                                        WidgetSearchIconText(
                                          iconData: Icons.bathroom_outlined,
                                          text: '2',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        WidgetSearchIconText(
                                          iconData: Icons.apartment_outlined,
                                          text: '2',
                                        ),
                                        SizedBox(width: 8),
                                        WidgetSearchIconText(
                                          iconData: Icons
                                              .photo_size_select_small_rounded,
                                          text: '1300 sqft',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    CustomText(
                                        text: "Zoo road, Mirpur-1",
                                        colorSystem: ColorSystem.instance.hint)
                                  ],
                                )),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: "2B,Rupali tower",
                                      colorSystem:
                                          ColorSystem.instance.primary),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: ColorSystem.instance.primary,
                                            borderRadius:
                                                BorderRadius.circular(48)),
                                        child: Icon(
                                          Icons.mark_email_unread_outlined,
                                          color:
                                              ColorSystem.instance.background,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: ColorSystem.instance.primary,
                                            borderRadius:
                                                BorderRadius.circular(48)),
                                        child: Icon(
                                          Icons.call,
                                          color:
                                              ColorSystem.instance.background,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
