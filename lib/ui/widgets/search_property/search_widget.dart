import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/colors.dart';
import '../../../core/text_style.dart';

class SearchWidget extends StatelessWidget {
  final Function onTap;
  SearchWidget({Key? key,required this.onTap}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
          color: ColorSystem.instance.card, borderRadius: BorderRadius.circular(24)),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        leading: Icon(
          Icons.search,
          color: ColorSystem.instance.text,
        ),
        title:  TextField(
          keyboardType: TextInputType.text,
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search flat / varatia / area / phone no",
            hintStyle: TextSystem.instance.small(ColorSystem.instance.text),
            border: InputBorder.none,
          ),
        ),
        trailing: CircleAvatar(
          backgroundColor: ColorSystem.instance.gradientEnd,
          child: Icon(
            MdiIcons.tuneVerticalVariant,
            color: ColorSystem.instance.background,
          ),
        ),
        onTap: (){
          onTap();
        },
      ),
    );
  }
}
