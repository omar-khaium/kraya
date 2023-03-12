import 'package:flutter/material.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';

import '../../../core/colors.dart';
import '../../../core/text_style.dart';

class TabPaymentPaid extends StatelessWidget {
  const TabPaymentPaid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      padding:const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (BuildContext context, int index) {
        return PhysicalModel(
          color: ColorSystem.instance.card,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    "John doe",
                    style: TextSystem.instance.large(ColorSystem.instance.text),
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(ColorSystem.instance.background),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: ColorSystem.instance.background,style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(16.0))),
                        ),
                        child:  Text("24,Rupali tower",style: TextSystem.instance.small(ColorSystem.instance.text),),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: ColorSystem.instance.primary,
                    backgroundImage: const NetworkImage(
                        'https://media.istockphoto.com/id/1291318636/photo/put-more-in-get-more-out.jpg?s=612x612&w=0&k=20&c=KRvn1x6r9x9GmYMLpW6AVZzkvOA0bmn14fKle-O6CVc='),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height:8),
                      WidgetLabelText(text: "Total :৳ 30,500", colorSystem: ColorSystem.instance.text),
                      WidgetLabelText(text: "Note :Payment in 4,June", colorSystem: ColorSystem.instance.text)
                    ],
                  ),
                ),
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: const EdgeInsets.only(right: 16),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: ColorSystem.instance.primary,
                            borderRadius: BorderRadius.circular(48)),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: ColorSystem.instance.background,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: ColorSystem.instance.primary,
                            borderRadius: BorderRadius.circular(48)),
                        child: Icon(
                          Icons.call,
                          color: ColorSystem.instance.background,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 8,
        );
      },
    );
  }
}
