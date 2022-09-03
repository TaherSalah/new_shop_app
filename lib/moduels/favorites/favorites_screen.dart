import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import '../../shared/component/ui_component.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if (state is ShopSuccessChangeFavoritesState) {
            if (state.favoritesModel.status == false) {
              showToast(
                  state: ToastStates.error, text: state.favoritesModel.message);
            } else {
              showToast(
                  state: ToastStates.success, text: state.favoritesModel.message);
            }
          }
        },
        builder: (context, state) {
          return Conditional.single(
            context:  context,
            conditionBuilder:(context) => state is! ShopLoadingFavoritesGetDataState,
          widgetBuilder: (BuildContext context)=>ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildListItems(
                  ShopCubit.get(context).getFavoritesModel!.data!.data[index].product,
                  context),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(13.0),
                child: myDivider(),
              ),
              itemCount:
              ShopCubit.get(context).getFavoritesModel!.data!.data.length),
            fallbackBuilder:  (BuildContext context)=>const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

