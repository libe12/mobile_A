import 'package:delivery_app/features/data/datasources/burger_remote_data_sources.dart';
import 'package:delivery_app/features/domain/entities/burger_entity.dart';
import 'package:delivery_app/features/domain/repositories/burger_repositories.dart';

class BurgerRepositoryImpl implements BurgerRepository {
  final BurgerRemoteDataSource remoteDataSource;

  BurgerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Burger>> getBurgers() async {
    final burgerModels = await remoteDataSource.getBurgersFromApi();
    return burgerModels.map((model) => model.toEntity()).toList();
  }
}
