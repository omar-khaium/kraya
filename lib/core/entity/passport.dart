import 'package:equatable/equatable.dart';

class PassportEntity extends Equatable {
  final String number;
  final String photoUrl;

  PassportEntity({
    required this.number,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [
        number,
        photoUrl,
      ];
}
