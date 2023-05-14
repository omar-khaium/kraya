import 'package:equatable/equatable.dart';

class AvailabilityEntity extends Equatable {
  final bool available;
  final DateTime from;

  AvailabilityEntity({
    required this.available,
    required this.from,
  });

  @override
  List<Object?> get props => [
        available,
        from,
      ];
}
