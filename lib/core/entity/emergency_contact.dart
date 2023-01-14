import 'package:equatable/equatable.dart';
import 'package:kraya_backend/core/entity/address.dart';

import 'contact.dart';

class EmergencyContactEntity extends Equatable {
  final String name;
  final int relation;
  final CurrentAddressEntity currentAddress;
  final PermanentAddressEntity? permanentAddress;
  final ContactEntity contact;

  EmergencyContactEntity({
    required this.name,
    required this.relation,
    required this.currentAddress,
    required this.permanentAddress,
    required this.contact,
  });

  @override
  List<Object?> get props => [
        name,
        relation,
        currentAddress,
        permanentAddress,
        contact,
      ];
}
