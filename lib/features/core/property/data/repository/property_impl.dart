import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/network/network_info.dart';
import '../../../../../core/error/exceptions.dart';
import '../../domain/entity/bills.dart';
import '../../domain/entity/details.dart';
import '../../domain/repository/property.dart';
import '../datasource/remote.dart';

class PropertyRepositoryImpl extends PropertyRepository {
  late PropertyRemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;

  PropertyRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PropertyDetailsEntity>> details({required int id}) async {
    try {
      if (await networkInfo.online) {
        final remoteProfile = await remoteDataSource.details(id: id);
        return Right(remoteProfile);
      } else {
        return Left(InteretDisconnectedFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PropertyBillsEntity>> bills({required int id}) async {
    try {
      if (await networkInfo.online) {
        final remoteProfile = await remoteDataSource.bills(id: id);
        return Right(remoteProfile);
      } else {
        return Left(InteretDisconnectedFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
