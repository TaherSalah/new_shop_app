

import '../../../models/shop_login_model/login_model.dart';

abstract class  ShopLoginStates {}

class ShopLoginIntialState extends ShopLoginStates{}

class ShopLoginLoadingState extends ShopLoginStates{}

class ShopLoginSuccessState extends ShopLoginStates{
  final ShopModel shopModel;
  ShopLoginSuccessState(this.shopModel);

}

class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopLoginVisibilityPasswordState extends ShopLoginStates{}