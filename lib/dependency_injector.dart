import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kraya_backend/core/network/network_info.dart';
import 'package:kraya_backend/features/core/bank/data/datasource/remote.dart';
import 'package:kraya_backend/features/core/bank/data/datasource/remote_impl.dart';
import 'package:kraya_backend/features/core/bank/data/repository/bank_impl.dart';

import 'features/core/bank/domain/repository/bank.dart';
import 'features/core/bank/domain/usecase/get_all.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Features - core/bank
  // * * Usecases
  sl.registerFactory(() => GetAllBanksUsecase(repository: sl()));

  // * * Repositories
  sl.registerLazySingleton<BankRepository>(
    () => BankRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // * * Datasources
  sl.registerLazySingleton<BankRemoteDataSource>(
    () => BankRemoteDataSourceImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        internetConnectionChecker: sl(),
        addresses: sl(),
      ));

  //! External
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<List<AddressCheckOptions>>(() => InternetConnectionChecker.DEFAULT_ADDRESSES);
}
