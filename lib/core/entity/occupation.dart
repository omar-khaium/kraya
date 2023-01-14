import 'package:equatable/equatable.dart';

class OccupationEntity extends Equatable {
  final String name;

  OccupationEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
