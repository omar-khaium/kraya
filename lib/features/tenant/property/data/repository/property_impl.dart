import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repository/property.dart';
import '../datasource/remote.dart';

class TenantPropertyRepositoryImpl extends TenantPropertyRepository {
  final TenantPropertyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TenantPropertyRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, bool>> add({
    required int tenantId,
    required int propertyId,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.add(
        tenantId: tenantId,
        propertyId: propertyId,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<int>>> search({
    required String keyword,
    required int typeId,
    required int subTypeId,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.search(
        keyword: keyword,
        typeId: typeId,
        subTypeId: subTypeId,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<int>>> getAll({
    required int tenantId,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.getAll(
        tenantId: tenantId,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
