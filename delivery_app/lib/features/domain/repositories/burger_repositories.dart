import 'package:delivery_app/features/domain/entities/burger_entity.dart';

abstract class BurgerRepository {
  Future<List<Burger>> getBurgers();
}
