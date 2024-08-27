import 'package:delivery_app/features/domain/entities/burger_entity.dart';
import 'package:delivery_app/features/domain/repositories/burger_repositories.dart';
import 'package:delivery_app/features/domain/usecases/usecase.dart';

class GetBurgers {
  final BurgerRepository repository;

  GetBurgers(this.repository);

  Future<List<Burger>> call() async {
    return await repository.getBurgers();
  }
}
