abstract class ShopStates {}

class ShopInitialState extends ShopStates{}

class ShopBottomNavigationBarState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{
  final String error;

  ShopErrorHomeDataState(this.error);

}