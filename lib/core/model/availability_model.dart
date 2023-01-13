import '../entity/availabiilty_entity.dart';

class AvailabilityModel extends AvailabilityEntity {
  AvailabilityModel({required bool available, required DateTime from}) : super(available: available, from: from);

  factory AvailabilityModel.fromJson(Map<String, dynamic> map) {
    return AvailabilityModel(
      available: map["available"],
      from: DateTime.fromMillisecondsSinceEpoch(map["from"]),
    );
  }
}
