import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kraya/model/family_information.dart';
import 'package:kraya/ui/widgets/sheet_add_family_information.dart';
import 'package:kraya/ui/widgets/sheet_emergency_contact.dart';
import '../../core/app_bar/custom_app_bar.dart';
import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../reusable_widgets/widget_family_info_items.dart';
import '../reusable_widgets/widget_lable_text.dart';
import '../widgets/profile/varatia_information_card.dart';
import '../widgets/sheet_varatia_information.dart';

class VaratiaProfileScreen extends StatefulWidget {
  const VaratiaProfileScreen({
    super.key,
  });

  @override
  State<VaratiaProfileScreen> createState() => _VaratiaProfileScreenState();
}

class _VaratiaProfileScreenState extends State<VaratiaProfileScreen> {
  final List<FamilyInformation> familyInfos = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Column(
        children: [
          const CustomAppBar(
              firstWord: "Police", lastWord: "Verification", isBackButtonVisible: true),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 54,
                          backgroundColor: ColorSystem.instance.alternateText,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipOval(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                "https://www.pngitem.com/pimgs/m/312-3127637_round-taylor-kevin-hd-png-download.png",
                                scale: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John doe",
                                style: TextSystem.instance.normal(ColorSystem.instance.text),
                              ),
                              WidgetLabelText(
                                text: "Designation",
                                colorSystem: ColorSystem.instance.hint,
                              ),
                              WidgetLabelText(
                                text: "Joined : 22 May,2023",
                                colorSystem: ColorSystem.instance.hint,
                              ),
                              Row(
                                children: [
                                  WidgetLabelText(
                                    text: "Rating : ",
                                    colorSystem: ColorSystem.instance.hint,
                                  ),
                                  RatingBar(
                                      initialRating: 3,
                                      maxRating: 5,
                                      itemCount: 5,
                                      itemSize: 12,
                                      ratingWidget: RatingWidget(
                                        empty: const Icon(
                                          Icons.star_border_outlined,
                                        ),
                                        full: const Icon(
                                          Icons.star,
                                        ),
                                        half: const Icon(
                                          Icons.star_half_outlined,
                                        ),
                                      ),
                                      onRatingUpdate: (value) {}),
                                  WidgetLabelText(
                                    text: " (30)",
                                    colorSystem: ColorSystem.instance.gradientEnd,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16.0))),
                                      ),
                                      child: const Text("24,Rupali tower"),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  CircleAvatar(
                                    backgroundColor: ColorSystem.instance.card,
                                    child: const Icon(Icons.chat_bubble_outline),
                                  ),
                                  const SizedBox(width: 8),
                                  CircleAvatar(
                                    backgroundColor: ColorSystem.instance.card,
                                    child: const Icon(Icons.call),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: WidgetLabelText(
                      text: "varatia information",
                      colorSystem: ColorSystem.instance.text,
                    ),
                    trailing: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            isScrollControlled: true,
                            builder: (context) => SheetVaratiaInformation(onTap: (
                                  nid,
                                  passport,
                                  email,
                                  religion,
                                  fatherName,
                                  permanentAddress,
                                  occupation,
                                  job,
                                ) {
                                  setState(() {});
                                }));
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
                      ),
                      child: const Text("Add"),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: PhysicalModel(
                      color: ColorSystem.instance.card,
                      elevation: 3,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            VaratiaInformationWidget(
                              titleText: 'Nid number',
                              titleTextValue: '1243 434566 566',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Passport number',
                              titleTextValue: 'BP 0011125',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Date of birth',
                              titleTextValue: '09/07/1996',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Religion',
                              titleTextValue: 'Islam',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Fathers name',
                              titleTextValue: 'Tanvir Ahmed',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Permanent address',
                              titleTextValue: 'H-31,R-10,Sector-6,Uttara',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Email',
                              titleTextValue: 'tanvir.piistech@gmail.com',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: WidgetLabelText(
                      text: "Emergency contact",
                      colorSystem: ColorSystem.instance.text,
                    ),
                    trailing: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            isScrollControlled: true,
                            builder: (context) =>
                                SheetEmergencyContact(onTap: (name, address, religion, phone) {
                                  setState(() {});
                                }));
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
                      ),
                      child: const Text("Add"),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: PhysicalModel(
                      color: ColorSystem.instance.card,
                      elevation: 3,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            VaratiaInformationWidget(
                              titleText: 'Name',
                              titleTextValue: 'Tanvir',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Address',
                              titleTextValue: 'H-31,R-10,Sector-6,Uttara',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Religion',
                              titleTextValue: 'Islam',
                            ),
                            SizedBox(height: 8),
                            VaratiaInformationWidget(
                              titleText: 'Contact number',
                              titleTextValue: '01737935210',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: WidgetLabelText(
                      text: "Family information",
                      colorSystem: ColorSystem.instance.text,
                    ),
                    trailing: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            isScrollControlled: true,
                            builder: (context) =>
                                SheetFamilyInformation(onTap: (name, age, occupation, relation) {
                                  setState(() {
                                    familyInfos.add(FamilyInformation(
                                      name: name,
                                      age: age,
                                      occupation: occupation,
                                      relation: relation,
                                    ));
                                  });
                                }));
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
                      ),
                      child: const Text("Add"),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    itemCount: familyInfos.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    itemBuilder: (_, index) {
                      final FamilyInformation families = familyInfos[index];
                      return WidgetFamilyInformationItems(
                        familyInformation: families,
                        onTap: () {},
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
