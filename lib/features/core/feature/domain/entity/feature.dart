import 'package:equatable/equatable.dart';

class FeatureEntity extends Equatable {
  final int id;
  final String name;

  FeatureEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
