import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';

import '../repository/bank_appointment.dart';

class AddOwnerAppointmentUsecase extends Usecase<bool, AddOwnerAppointmenParams> {
  final OwnerAppointmentRepository _repository;

  AddOwnerAppointmentUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(param) async {
    return await _repository.add(
      ownerId: param.ownerId,
      name: param.name,
      phone: param.phone,
      secondPhone: param.secondPhone,
      address: param.address,
      latitude: param.latitude,
      longitude: param.longitude,
      date: param.date,
    );
  }
}

class AddOwnerAppointmenParams {
  final int ownerId;
  final String name;
  final String phone;
  final String? secondPhone;
  final String address;
  final double latitude;
  final double longitude;
  final DateTime date;

  AddOwnerAppointmenParams({
    required this.ownerId,
    required this.name,
    required this.phone,
    required this.secondPhone,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.date,
  });
}
