import 'package:delivery_app/features/domain/entities/burger_entity.dart';
import 'package:delivery_app/features/domain/usecases/get_burgers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:your_package_name/features/domain/usecases/get_all_burgers.dart';
import 'burger_event.dart';
import 'burger_state.dart';

class BurgerBloc extends Bloc<BurgerEvent, BurgerState> {
  final GetBurgers getAllBurgers;

  BurgerBloc({required this.getAllBurgers}) : super(BurgerInitial()) {
    on<LoadBurgers>((event, emit) async {
      try {
        final List<Burger> burgers = await getAllBurgers.call();
        emit(BurgerLoaded(burgers: burgers));
      } catch (e) {
        emit(BurgerError(message: e.toString()));
      }
    });
  }
}
