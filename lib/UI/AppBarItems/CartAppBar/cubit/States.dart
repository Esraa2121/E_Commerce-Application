import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';

abstract class CartStates {}

class InitialCartState extends CartStates {}

class GeneralCartState extends CartStates {
  String message;

  GeneralCartState({required this.message});
}

class SuccessCartState extends CartStates {
  GetAndRemoveFromCartEntity cartEntity;

  SuccessCartState({required this.cartEntity});
}
