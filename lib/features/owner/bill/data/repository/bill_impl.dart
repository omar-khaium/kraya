import '../../../../../core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/network/network_info.dart';
import '../../domain/repository/bill.dart';
import '../datasource/remote.dart';

class OwnerBillRepositoryImpl extends OwnerBillRepository {
  final OwnerBillRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerBillRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, bool>> add({
    required int ownerId,
    required int propertyId,
    required String name,
    required int amount,
    required int extra,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.add(
        ownerId: ownerId,
        propertyId: propertyId,
        name: name,
        amount: amount,
        extra: extra,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
