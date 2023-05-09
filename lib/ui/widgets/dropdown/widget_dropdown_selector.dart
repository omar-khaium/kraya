import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/text_style.dart';
import '../../../model/drop_down_item.dart';


// ignore: must_be_immutable
class DropDownSelector extends StatefulWidget {
  String value;
  final String title;
  final List<DropDownItem> items;
  final Function(String) onSelect;

  DropDownSelector({Key? key, required this.value, required this.title, required this.items, required this.onSelect})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DropDownSelectorState createState() => _DropDownSelectorState();
}

class _DropDownSelectorState extends State<DropDownSelector> {
  final TextEditingController searchController = TextEditingController();

  List<DropDownItem> list = [];

  @override
  void initState() {
    list = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: ColorSystem.instance.background,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(widget.title, style: TextSystem.instance.normal(ColorSystem.instance.text),),
            backgroundColor: ColorSystem.instance.background,
            centerTitle: false,
            elevation: 0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    setState(() {
                      list = widget.items.where((element) => element.text.toLowerCase().startsWith(value.toLowerCase())).toList();
                    });
                  },
                  decoration: const InputDecoration(hintText: "search"),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final DropDownItem item = list[index];
                    return ListTile(
                      onTap: () {
                        setState(() {
                          widget.value = item.value;
                        });
                        widget.onSelect(item.value);
                        Navigator.of(context).pop();
                      },
                      title: Text(item.text.trim(), style: TextSystem.instance.small(ColorSystem.instance.text)),
                      leading: Icon(
                        widget.value.toLowerCase() == item.value.toLowerCase()
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_rounded,
                        color: ColorSystem.instance.gradientEnd,
                      ),
                      dense: false,
                      visualDensity: VisualDensity.comfortable,
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        );
      
  }
}
