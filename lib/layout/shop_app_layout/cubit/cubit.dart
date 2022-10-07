import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/shared/network/local/cache_helper.dart';
import '../../../models/Shop_add_favorites/add_favorites_model.dart';
import '../../../models/add_cart_model/change_cart.dart';
import '../../../models/add_cart_model/get_cart.dart';
import '../../../models/get_favorites_model/get_favorites.dart';
import '../../../models/shop_categories_model/categories_model.dart';
import '../../../models/shop_get_user_data/user_data_model.dart';
import '../../../models/shop_home_model/home_model.dart';
import '../../../models/shop_update__profile/update_profile_model.dart';
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
    SettingesScreen(),
  ];
  Map<int, bool> favorites = {};
  Map<int, bool> inCart = {};

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
      //////   for each in add to cart /////////
      // ignore: avoid_function_literals_in_foreach_calls
      homeModel!.data!.products.forEach((element) {
        inCart.addAll({element.id!: element.inCart});
        // ignore: avoid_print
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
      url: categories,
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
      } else {
        favoritesGetData();
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
    emit(ShopLoadingFavoritesGetDataState());
    DioHelper.getData(
      url: getFavorites,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      getFavoritesModel = GetFavoritesModel.fromJson(value.data);
      // ignore: avoid_print
      print(getFavoritesModel!.data!.data.length);
      // printFullText(value.data.toString());
      emit(ShopSuccessFavoritesGetDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorFavoritesGetDataState(error));
    });
  }
////////////  End Get Favorites Model Method ////////////
//////////// Start Get cart Data /////////////
  CartModel? cartModel;
  void getCartData()
  {
     emit(ShopGetCartLoadingState());
     DioHelper.getData(
       url: getCart,
       token: CacheHelper.getData(key: 'token'),
     ).then((value){
       cartModel=CartModel.fromJson(value.data);
       if(cartModel!.status!){
         // ignore: avoid_print
         print('total price for cart is ${cartModel!.data!.total}');
         emit(ShopGetCartSuccessState());
       }
     }).catchError((error){
       emit(ShopGetCartErrorState());
       // ignore: avoid_print
       print(error.toString());
     });
  }
//////////// End Get cart Data /////////////

//////////// Start change Cart Products /////////////
  ChangeCartModel? changeCartModel;
  void changeCart({required int productId})
  {
    inCart[productId] = !inCart[productId]!;
    emit(ShopChangeCartLoadingState());
    DioHelper.postData(

        url: 'carts',
        data: {
      'product_id':productId,
        },
    token: CacheHelper.getData(key: 'token'),
    ).then((value){
      changeCartModel=ChangeCartModel.fromJson(value.data);
      if(changeCartModel!.status==true){
        getCartData();
        // ignore: avoid_print
        print(changeCartModel!.status);

      }
      // ignore: avoid_print
      emit(ShopChangeCartSuccessState());
    }).catchError((error){
      emit(ShopChangeCartErrorState());
      // ignore: avoid_print
      print(error.toString());
    });


  }
//////////// End change Cart Products /////////////

////////////  Start Get User Data Model Method ////////////
  GetUserDataModel? getUserDataModel;
  void getUserData() {
    emit(ShopLoadingGetUserDataState());
    DioHelper.getData(url: getData, token: CacheHelper.getData(key: 'token'))
        .then((value) {
      getUserDataModel = GetUserDataModel.fromJson(value.data);
      // ignore: avoid_print
      emit(ShopSuccessGetUserDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorGetUserDataState(error));
    });
  }
////////////  End Get User Data Model Method ////////////

////////////  Start Update Profile User  Model Method ////////////
  UpdateUserModel? updateUserModel;
  void updateData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateProfileDataState());
    DioHelper.putData(
        url: updateProfile,
        token: CacheHelper.getData(
          key: 'token',
        ),
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        }).then((value) {
      updateUserModel = UpdateUserModel.fromJson(value.data);
      getUserData();
      // ignore: avoid_print
      print(updateUserModel!.data!.name);
      emit(ShopSuccessUpdateProfileDataState(updateUserModel!));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorUpdateProfileDataState(error));
    });
  }

  bool isReadMore = true;

  void defaultBackReadMore() {
    isReadMore = true;
    emit(ShopCubitDefaultReadMoreState());
  }

  void showDescription() {
    isReadMore = !isReadMore;
    emit(ShopCubitReadMoreDescriptionState());
  }

////////////  End Update Profile User  Model Method ////////////
}

///////////  End Get Home Data ////////
