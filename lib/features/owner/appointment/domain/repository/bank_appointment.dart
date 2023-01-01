import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';

@GenerateNiceMocks([MockSpec<OwnerAppointmentRepository>()])
abstract class OwnerAppointmentRepository {
  Future<Either<Failure, bool>> add({
    required int ownerId,
    required String name,
    required String phone,
    required String? secondPhone,
    required String address,
    required double latitude,
    required double longitude,
    required DateTime date,
  });
}
