import '../entity/availabiilty.dart';

class AvailabilityModel extends AvailabilityEntity {
  AvailabilityModel({
    required super.available,
    required super.from,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> map) {
    return AvailabilityModel(
      available: map["available"] ?? false,
      from: DateTime.fromMillisecondsSinceEpoch(map["from"] ?? 0),
    );
  }
}
