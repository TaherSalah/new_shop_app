import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:new_shop_app/moduels/categories/categories_screen.dart';
import 'package:new_shop_app/moduels/favorites/favorites_screen.dart';
import 'package:new_shop_app/moduels/products/products_screen.dart';
import 'package:new_shop_app/shared/component/component.dart';
import 'package:new_shop_app/shared/component/constance.dart';
import 'package:new_shop_app/shared/network/end_points.dart';
import 'package:new_shop_app/shared/network/remote/dio_helper.dart';
import '../../../models/shop_categories_model/categories_model.dart';
import '../../../models/shop_home_model/home_model.dart';
import '../../../moduels/settings/settings_screen.dart';

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
      // ignore: avoid_print
      printFullText(homeModel!.data!.products[0].name.toString());
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

  void getCategories()
  {
    DioHelper.getData(url: get_categories,token: tokenData,).then((value)
    {
      categoriesModel=CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }
    ).catchError((error)
    {
      emit(ShopErrorCategoriesDataState(error));
      // ignore: avoid_print
      print(error.toString());
    });
  }

}


//////////// End Get Categories Data /////////////


///////////  End Get Home Data ////////







