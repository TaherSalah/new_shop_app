import 'package:softagy_shop_app/models/Shop_add_favorites/add_favorites_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopBottomNavigationBarState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
  final String error;

  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoriesDataState extends ShopStates {}

class ShopErrorCategoriesDataState extends ShopStates {
  final String error;

  ShopErrorCategoriesDataState(this.error);
}



////////////////  Start  favorites States    ///////////////////
class ShopLoadingChangeFavoritesState extends ShopStates {}
class ShopSuccessChangeFavoritesState extends ShopStates {
  final FavoritesModel favoritesModel;

  ShopSuccessChangeFavoritesState(this.favoritesModel);

}

class ShopErrorChangeFavoritesState extends ShopStates {
  final String error;

  ShopErrorChangeFavoritesState(this.error);
}
////////////////  End  favorites States    ///////////////////

////////////////  Start get  favorites States    ///////////////////

class ShopLoadingFavoritesGetDataState extends ShopStates {}

class ShopSuccessFavoritesGetDataState extends ShopStates {

}

class ShopErrorFavoritesGetDataState extends ShopStates {
  final String error;

  ShopErrorFavoritesGetDataState(this.error);
}

////////////////  Start get  User Data States    ///////////////////


class ShopLoadingGetUserDataState extends ShopStates {}

class ShopSuccessGetUserDataState extends ShopStates {

}

class ShopErrorGetUserDataState extends ShopStates {
  final String error;

  ShopErrorGetUserDataState(this.error);
}