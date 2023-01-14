import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String label;

  AddressEntity({
    required this.label,
  });

  @override
  List<Object?> get props => [
        label,
      ];
}

class PermanentAddressEntity extends AddressEntity {
  PermanentAddressEntity({required super.label});
}

class CurrentAddressEntity extends AddressEntity {
  CurrentAddressEntity({required super.label});
}
