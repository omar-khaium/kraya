import 'package:equatable/equatable.dart';

class RelationEntity extends Equatable {
  final int id;
  final String type;

  RelationEntity({required this.id, required this.type});

  @override
  List<Object?> get props => [id, type];
}
