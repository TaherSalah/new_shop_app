
abstract class  ShopLoginStates {}

class ShopLoginIntialState extends ShopLoginStates{}

class ShopLoginLoadingState extends ShopLoginStates{}

class ShopLoginSuccessState extends ShopLoginStates{}

class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopLoginVisibilityPasswordState extends ShopLoginStates{}