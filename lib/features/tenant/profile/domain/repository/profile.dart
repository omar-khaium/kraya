import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../../core/error/failures.dart';
import '../entity/full_profile.dart';

@GenerateNiceMocks([MockSpec<TenantProfileRepository>()])
abstract class TenantProfileRepository {
  Future<Either<Failure, bool>> update({
    required int tenantId,
    required String nidNumber,
    required String passportNumber,
    required String email,
    required int religion,
    required String fatherName,
    required String address,
    required String occupation,
    required String jobAddress,
    required File? nidPhoto,
  });
  Future<Either<Failure, TenantFullProfileEntity>> fullProfile({required int tenantId});
}
