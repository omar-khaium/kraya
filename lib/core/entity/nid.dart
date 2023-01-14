import 'package:equatable/equatable.dart';

class NIDEntity extends Equatable {
  final String number;
  final String frontSide;
  final String? backSide;

  NIDEntity({
    required this.number,
    required this.frontSide,
    required this.backSide,
  });

  @override
  List<Object?> get props => [
        number,
        frontSide,
        backSide,
      ];
}
