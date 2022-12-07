import 'package:flutter/material.dart';

import '../core/app_router.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class NewUserTypeSelectionScreen extends StatefulWidget {
  const NewUserTypeSelectionScreen({super.key});

  @override
  State<NewUserTypeSelectionScreen> createState() => _NewUserTypeSelectionScreenState();
}

class _NewUserTypeSelectionScreenState extends State<NewUserTypeSelectionScreen> {
  _UserTypeSelection selection = _UserTypeSelection.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.instance.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.switch_account_rounded, size: 144, color: ColorSystem.instance.primary),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: "Select",
                        style: TextSystem.instance.tooLarge(ColorSystem.instance.text),
                        children: [
                          TextSpan(text: " user type", style: TextSystem.instance.tooLarge(ColorSystem.instance.primary)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: card(
                              label: "Owner",
                              icon: Icons.home_rounded,
                              selected: selection == _UserTypeSelection.owner,
                              onTap: () {
                                setState(() {
                                  selection = _UserTypeSelection.owner;
                                });

                                Future.delayed(const Duration(milliseconds: 500), () {
                                  Navigator.of(context).pushNamed(AppRouter.createAccount);
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: card(
                              label: "Varatia",
                              icon: Icons.apartment_rounded,
                              selected: selection == _UserTypeSelection.varatia,
                              onTap: () {
                                setState(() {
                                  selection = _UserTypeSelection.varatia;
                                });
                                Future.delayed(const Duration(milliseconds: 500), () {
                                  Navigator.of(context).pushNamed(AppRouter.createAccount);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: "Please select if you are an",
                        style: TextSystem.instance.small(ColorSystem.instance.text),
                        children: [
                          TextSpan(text: " Owner", style: TextSystem.instance.small(ColorSystem.instance.primary)),
                          TextSpan(text: " or", style: TextSystem.instance.small(ColorSystem.instance.text)),
                          TextSpan(text: " Varatia", style: TextSystem.instance.small(ColorSystem.instance.primary)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: backButton(),
          ),
        ],
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      iconSize: 48,
      splashRadius: 28,
      splashColor: ColorSystem.instance.cardDeep,
      onPressed: () => Navigator.of(context).pushReplacementNamed(AppRouter.otpVerification),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      padding: EdgeInsets.zero,
      icon: CircleAvatar(
        radius: 24,
        backgroundColor: ColorSystem.instance.primary,
        child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      ),
    );
  }

  Widget card({required String label, required IconData icon, required bool selected, required VoidCallback onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: PhysicalModel(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        color: selected ? ColorSystem.instance.primary : ColorSystem.instance.card,
        shadowColor: selected ? ColorSystem.instance.primary : ColorSystem.instance.cardDeep,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: selected ? Colors.white : ColorSystem.instance.text),
                Text(
                  label,
                  style: TextSystem.instance.large(selected ? Colors.white : ColorSystem.instance.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _UserTypeSelection { none, owner, varatia }
