import '../../domain/entity/banner.dart';

class BannerModel extends BannerEntity {
  BannerModel({required super.url, required super.action, required super.expiresAt});

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      url: map["url"] ?? "",
      action: map["action"] ?? "",
      expiresAt: DateTime.fromMillisecondsSinceEpoch(map["expires-at"] ?? 0),
    );
  }
}
