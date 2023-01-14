import 'package:equatable/equatable.dart';

class FatherEntity extends Equatable {
  final String name;

  FatherEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
