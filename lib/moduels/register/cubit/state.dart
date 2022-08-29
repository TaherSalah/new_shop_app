

import '../../../models/shop_login_model/login_model.dart';

abstract class  ShopRegisterStates {}

class ShopRegisterIntialState extends ShopRegisterStates{}

class ShopRegisterLoadingState extends ShopRegisterStates{}

class ShopRegisterSuccessState extends ShopRegisterStates{
  final ShopModel shopModel;
  ShopRegisterSuccessState(this.shopModel);

}

class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}
class ShopRegisterVisibilityPasswordState extends ShopRegisterStates{}