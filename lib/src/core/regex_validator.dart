class RegexValidator {
  static bool email(String val) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)'
          r'+[a-zA-Z]{2,}))$')
      .hasMatch(val);

  static bool phone(String val) => RegExp(r'^(?:\+?88)?01[13-9]\d{8}$').hasMatch(val);

  static String? convertPhoneNumber(String val) => RegExp(r'^(?:\+?88)?01[13-9]\d{8}$').allMatches(val).join("");

  static bool name(String val) => !RegExp(r'[!@#<>?":_`~;,{.}[\])/(\\|=+$*&^%0-9-]').hasMatch(val);
}
