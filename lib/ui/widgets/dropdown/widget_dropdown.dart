import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/text_style.dart';
import '../../../model/drop_down_item.dart';
import 'widget_dropdown_selector.dart';

class DropDownMenu extends StatelessWidget {
  final String? value;
  final String? title;
  final String? text;
  final List<DropDownItem> items;
  final bool shouldValidate;
  final Function(String) onSelect;
  final bool validationFlag;

  const DropDownMenu({
    Key? key,
    required this.value,
    required this.text,
    required this.title,
    required this.items,
    required this.onSelect,
    required this.shouldValidate,
    required this.validationFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
            color: ColorSystem.instance.card,
            borderRadius: BorderRadius.circular(8),
            border: shouldValidate
                ? (value?.isNotEmpty ?? false ? Border.all(color: Colors.black, width: 0) : Border.all(color: ColorSystem.instance.error, width: .5))
                : Border.all(color: Colors.transparent, width: 0),
          ),
          child: ListTile(
            dense: true,
            title: Text(
              text ?? "",
              style: TextSystem.instance.small(shouldValidate ? (value!.isNotEmpty ? ColorSystem.instance.text : ColorSystem.instance.error) : ColorSystem.instance.text),
              textAlign: TextAlign.start,
            ),
            trailing: Icon(
              Icons.arrow_drop_down_outlined,
              size: 20,
              color: shouldValidate
                  ? validationFlag
                      ? ColorSystem.instance.text
                      : ColorSystem.instance.error
                  : ColorSystem.instance.text,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DropDownSelector(
                          value: value ?? "",
                          title: title ?? "",
                          items: items,
                          onSelect: (value) {
                            onSelect(value);
                          },
                        ),
                    fullscreenDialog: true),
              );
            },
          ),
        );
      
  }
}
