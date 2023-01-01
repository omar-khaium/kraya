import '../../../../../core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/network/network_info.dart';
import '../../domain/repository/bank_account.dart';
import '../datasource/remote.dart';

class OwnerBankAccountRepositoryImpl extends OwnerBankAccountRepository {
  final OwnerBankAccountRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OwnerBankAccountRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, bool>> add({
    required int ownerId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.add(
        ownerId: ownerId,
        bankId: bankId,
        name: name,
        accountNumber: accountNumber,
        branch: branch,
      );
      return Right(result);
    } else {
      return Left(InteretDisconnectedFailure());
    }
  }
}
