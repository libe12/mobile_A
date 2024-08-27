import 'package:delivery_app/features/domain/entities/burger_entity.dart';
import 'package:equatable/equatable.dart';
//import 'package:your_package_name/features/domain/entities/burger_entity.dart';

abstract class BurgerState extends Equatable {
  @override
  List<Object> get props => [];
}

class BurgerInitial extends BurgerState {}

class BurgerLoading extends BurgerState {}

class BurgerLoaded extends BurgerState {
  final List<Burger> burgers;

  BurgerLoaded({required this.burgers});

  @override
  List<Object> get props => [burgers];
}

class BurgerError extends BurgerState {
  final String message;

  BurgerError({required this.message});

  @override
  List<Object> get props => [message];
}
