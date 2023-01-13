import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repository/bank_account.dart';
import '../datasource/remote.dart';

class TenantBankAccountRepositoryImpl extends TenantBankAccountRepository {
  final TenantBankAccountRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TenantBankAccountRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, bool>> add({
    required int tenantId,
    required int bankId,
    required String name,
    required String accountNumber,
    required String branch,
  }) async {
    if (await networkInfo.online) {
      final result = await remoteDataSource.add(
        tenantId: tenantId,
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
