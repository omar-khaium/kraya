import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kraya/core/app_bar/custom_app_bar.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/core/text_style.dart';
import 'package:kraya/ui/reusable_widgets/widget_lable_text.dart';

class FragmentProperty extends StatefulWidget {
  const FragmentProperty({Key? key}) : super(key: key);

  @override
  State<FragmentProperty> createState() => _FragmentPropertyState();
}

class _FragmentPropertyState extends State<FragmentProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAppBar(firstWord: "Property", lastWord: "List",isBackButtonVisible: false,),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return PhysicalModel(
                  color: ColorSystem.instance.card,
                  borderRadius: BorderRadius.circular(8),
                  child:  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          title: Text(
                            "John doe",
                            style: TextSystem.instance.normal(ColorSystem.instance.text),
                          ),
                          trailing: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2.5,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                              ),
                              child: const Text("24,Rupali tower"),
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: ColorSystem.instance.primary,
                            backgroundImage: const NetworkImage('https://media.istockphoto.com/id/1291318636/photo/put-more-in-get-more-out.jpg?s=612x612&w=0&k=20&c=KRvn1x6r9x9GmYMLpW6AVZzkvOA0bmn14fKle-O6CVc='),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.location_on_outlined,size: 14,),
                                const SizedBox(width: 8),
                                Text('302-AE,Rupali tower,Mirpur',
                                  style: TextSystem.instance.small(ColorSystem.instance.hint),),
                              ],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding:const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: ColorSystem.instance.primary,
                                    borderRadius: BorderRadius.circular(48)
                                ),
                                child:Icon(Icons.mark_email_unread_outlined,color: ColorSystem.instance.background,),
                              ),
                              const SizedBox(width:8),
                              Container(
                                padding:const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: ColorSystem.instance.primary,
                                    borderRadius: BorderRadius.circular(48)
                                ),
                                child:Icon(Icons.call,color: ColorSystem.instance.background,),
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
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },
        heroTag: null,
      child: const Icon(Icons.add),),
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
