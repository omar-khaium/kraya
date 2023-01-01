import '../../../../../core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/network/network_info.dart';
import '../../domain/repository/bank_appointment.dart';
import '../datasource/remote.dart';

class OwnerAppointmentRepositoryImpl extends OwnerAppointmentRepository {
  final OwnerAppointmentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerAppointmentRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> add(
      {required int ownerId,
      required String name,
      required String phone,
      required String? secondPhone,
      required String address,
      required double latitude,
      required double longitude,
      required DateTime date}) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.add(
        ownerId: ownerId,
        name: name,
        phone: phone,
        secondPhone: secondPhone ?? "",
        address: address,
        latitude: latitude,
        longitude: longitude,
        date: date,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
