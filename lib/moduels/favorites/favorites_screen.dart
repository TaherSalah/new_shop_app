import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/models/get_favorites_model/get_favorites.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';

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
              itemBuilder: (context, index) => buildFavoritesItems(
                  ShopCubit.get(context).getFavoritesModel!.data!.data[index],
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

Widget buildFavoritesItems(Data model, context) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130.0,
          width: 125.0,
          color: whiteColor,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(
                    // ignore: unnecessary_string_interpolations
                    '${model.product!.image}'),
                height: 130.0,
                width: 125.0,
              ),
              if (model.product!.discount != 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  color: defaultColor,
                  child: const Text(
                    'discount',
                    style: TextStyle(fontSize: 12.5, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
        sizeBoxW,
        Expanded(
          child: Container(
            height: 100,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.product!.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis, height: 1.5),
                ),
                const Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '${model.product!.price.round()}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      sizeBoxW,
                      if (model.product!.discount != 0)
                        Text(
                          '${model.product!.oldPrice.round()}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            ShopCubit.get(context).changFavorites(model.product!.id);
                          },
                          icon:  Icon(
                            Icons.favorite_rounded,
                            color: ShopCubit.get(context).favorites[model.product!.id] == true
                                ? grayColor
                                : defaultColor,
                            size: 20,
                          )),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
