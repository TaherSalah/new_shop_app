import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import 'package:softagy_shop_app/shared/network/local/cache_helper.dart';
import '../../../models/Shop_add_favorites/add_favorites_model.dart';
import '../../../models/get_favorites_model/get_favorites.dart';
import '../../../models/shop_categories_model/categories_model.dart';
import '../../../models/shop_home_model/home_model.dart';
import '../../../moduels/categories/categories_screen.dart';
import '../../../moduels/favorites/favorites_screen.dart';
import '../../../moduels/products/products_screen.dart';
import '../../../moduels/settings/settings_screen.dart';
import '../../../shared/component/constance.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  /////// current var For index /////
  int currentIndex = 0;
//////// Screen  List //////////
  List<Widget> screenBottom = [
    const ProductsScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingesScreen(),
  ];
  Map<int, bool> favorites = {};
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopBottomNavigationBarState());
  }

  ///////////  Start Get Home Data ////////
  ///////////  new object from home Model ////////
  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: home, token: tokenData).then((value) {
      emit(ShopSuccessHomeDataState());
      homeModel = HomeModel.fromJson(value.data);
      /////// create favorites method //////
      // ignore: avoid_function_literals_in_foreach_calls
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
        // ignore: avoid_print
        // print(favorites.toString());
      });
      // ignore: avoid_print
      // printFullText(homeModel!.data!.products[0].name.toString());
      // ignore: avoid_print
      // print(homeModel.status);
      // printFullText(homeModel.toString());
    }).catchError((error) {
      emit(ShopErrorHomeDataState(error.toString()));
      // ignore: avoid_print
      print(error.toString());
    });
  }

//////////// Start Get Categories Data /////////////
  CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(
      url: get_categories,
      token: tokenData,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }).catchError((error) {
      emit(ShopErrorCategoriesDataState(error));
      // ignore: avoid_print
      print(error.toString());
    });
  }

  ////////////  Start Post Favorites Model Method ////////////
  FavoritesModel? favoritesModel;
  void changFavorites(int productsId) {
    favorites[productsId] = !favorites[productsId]!;
    emit(ShopLoadingChangeFavoritesState());
    DioHelper.postData(
            url: getFavorites,
            data: {'product_id': productsId},
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      if (favoritesModel!.status == false) {
        favorites[productsId] = !favorites[productsId]!;
      }
      emit(ShopSuccessChangeFavoritesState(favoritesModel!));
      // ignore: avoid_print

      // ignore: avoid_print
      print(value.data);
    }).catchError((error) {
      favorites[productsId] = !favorites[productsId]!;
      emit(ShopErrorChangeFavoritesState(error));
      // ignore: avoid_print
      print(error.toString());
    });
  }
////////////  End Get Favorites Model Method ////////////

////////////  Start Get Favorites Model Method ////////////

  GetFavoritesModel? getFavoritesModel;

  void favoritesGetData() {
    // emit(ShopGetFavoritesLoadingState());

    DioHelper.getData(
      url: getFavorites,
   token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      getFavoritesModel = GetFavoritesModel.fromJson(value.data);
printFullText(value.data.toString());
      emit(ShopSuccessFavoritesGetDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorFavoritesGetDataState(error));    });
  }
////////////  End Get Favorites Model Method ////////////

}
//////////// End Get Categories Data /////////////

///////////  End Get Home Data ////////
