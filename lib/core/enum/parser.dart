import 'enums.dart';

class EnumParser {
  static final EnumParser _instance = EnumParser._private();
  static EnumParser get instance => _instance;

  EnumParser._private();

  Gender toGender(String value) {
    switch (value.toLowerCase().trim()) {
      case "male":
        return Gender.male;
      case "female":
        return Gender.female;
      case "other":
      case "others":
        return Gender.other;
      default:
        return Gender.none;
    }
  }

  PropertyType toPropertyType(String value) {
    switch (value.toLowerCase().trim()) {
      case "residential":
        return PropertyType.residential;
      case "commercial":
        return PropertyType.commercial;
      default:
        return PropertyType.none;
    }
  }

  PropertySubType toPropertySubType(String value) {
    switch (value.toLowerCase().trim()) {
      case "flat":
        return PropertySubType.flat;
      case "building":
        return PropertySubType.building;
      case "office":
        return PropertySubType.office;
      case "shop":
        return PropertySubType.shop;
      default:
        return PropertySubType.none;
    }
  }

  String fromGender(Gender gender) {
    switch (gender) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
      case Gender.other:
        return "Others";
      case Gender.none:
        return "None";
    }
  }

  Role toRole(String value) {
    switch (value.toLowerCase().trim()) {
      case "owner":
        return Role.owner;
      case "tenant":
        return Role.tenant;
      default:
        return Role.none;
    }
  }

  String fromRole(Role role) {
    switch (role) {
      case Role.owner:
        return "Owner";
      case Role.tenant:
        return "Tenant";
      case Role.none:
        return "None";
    }
  }

  PaymentStatus toPaymentStatus(String value) {
    switch (value.toLowerCase().trim()) {
      case "paid":
        return PaymentStatus.paid;
      case "unpaid":
        return PaymentStatus.unpaid;
      default:
        return PaymentStatus.none;
    }
  }

  String fromPaymentStatus(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.paid:
        return "paid";
      case PaymentStatus.unpaid:
        return "unpaid";
      case PaymentStatus.none:
        return "";
    }
  }
}
