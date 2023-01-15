import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../repository/profile.dart';

class TenantUpdateProfileUsecase implements Usecase<bool, TenantUpdateProfileParam> {
  final TenantProfileRepository _repository;

  TenantUpdateProfileUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(TenantUpdateProfileParam param) async {
    return await _repository.update(
      tenantId: param.tenantId,
      nidNumber: param.nidNumber,
      passportNumber: param.passportNumnber,
      email: param.email,
      religion: param.religion,
      fatherName: param.fatherName,
      address: param.address,
      occupation: param.occupation,
      jobAddress: param.jobAddress,
      nidPhoto: param.nidPhoto,
    );
  }
}

class TenantUpdateProfileParam {
  final int tenantId;
  final String nidNumber;
  final String passportNumnber;
  final String email;
  final int religion;
  final String fatherName;
  final String address;
  final String occupation;
  final String jobAddress;
  final File? nidPhoto;
  TenantUpdateProfileParam({
    required this.tenantId,
    required this.nidNumber,
    required this.passportNumnber,
    required this.email,
    required this.religion,
    required this.fatherName,
    required this.address,
    required this.occupation,
    required this.jobAddress,
    required this.nidPhoto,
  });
}
