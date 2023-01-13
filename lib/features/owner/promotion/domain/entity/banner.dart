import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String url;
  final String action;
  final DateTime expiresAt;

  BannerEntity({
    required this.url,
    required this.action,
    required this.expiresAt,
  });

  @override
  List<Object?> get props => [url, action, expiresAt];
}
