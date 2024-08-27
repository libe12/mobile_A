import 'package:delivery_app/features/data/datasources/burger_remote_data_sources.dart';
import 'package:delivery_app/features/data/repositories/burger_repository_impl.dart';
import 'package:delivery_app/features/domain/repositories/burger_repositories.dart';
import 'package:delivery_app/features/domain/usecases/get_burgers.dart';
import 'package:delivery_app/features/presentation/bloc/burger_bloc.dart';
import 'package:get_it/get_it.dart'; // Import GetIt package
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  //Register bloc
  sl.registerFactory(() => BurgerBloc(getAllBurgers: sl()));
  // Register Data Sources
  sl.registerLazySingleton<BurgerRemoteDataSource>(
      () => BurgerRemoteDataSourceImpl(client: sl()));

  // Register Repositories
  sl.registerLazySingleton<BurgerRepository>(
      () => BurgerRepositoryImpl(remoteDataSource: sl()));
  //Register usecase
  sl.registerLazySingleton(() => GetBurgers(sl()));
  // External

  sl.registerLazySingleton(() => http.Client());
}
