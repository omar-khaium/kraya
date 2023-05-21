import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/text_style.dart';

class WidgetDateOfBirth extends StatefulWidget {
  WidgetDateOfBirth({Key? key}) : super(key: key);

  @override
  State<WidgetDateOfBirth> createState() => _WidgetDateOfBirthState();
}

class _WidgetDateOfBirthState extends State<WidgetDateOfBirth> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date of birth", style: TextSystem.instance.small(ColorSystem.instance.hint)),
        const SizedBox(height: 4),
        InkWell(
          onTap: (){
            _selectDate(context);
          },
          child: PhysicalModel(
            elevation: 4,
            color: ColorSystem.instance.card,
            shadowColor: ColorSystem.instance.cardDeep,
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time_rounded, color: ColorSystem.instance.primary),
                  const SizedBox(width: 12),
                  Text("${selectedDate.toLocal()}".split(' ')[0], style: TextSystem.instance.normal(ColorSystem.instance.text)),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
