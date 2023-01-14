import 'package:equatable/equatable.dart';
import 'package:kraya_backend/core/entity/contact.dart';
import 'package:kraya_backend/core/entity/nid.dart';
import 'package:kraya_backend/core/entity/occupation.dart';

class FamilyMemeberEntity extends Equatable {
  final String name;
  final DateTime dateOfBirth;
  final int relation;
  final OccupationEntity occupation;
  final NIDEntity? nid;
  final ContactEntity contact;

  FamilyMemeberEntity({
    required this.name,
    required this.dateOfBirth,
    required this.relation,
    required this.occupation,
    required this.nid,
    required this.contact,
  });

  @override
  List<Object?> get props => [
        name,
        dateOfBirth,
        relation,
        occupation,
        nid,
        contact,
      ];
}
