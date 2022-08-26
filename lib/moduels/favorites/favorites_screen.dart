import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state){
          return ListView.separated(
              itemBuilder: (context,index)=>buildFavoritesItems(context,ShopCubit.get(context).getFavoritesModel),
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.all(13.0),
                child: myDivider(),
              ),
              itemCount:10);
        },
      ),
    );
  }
}

Widget buildFavoritesItems(context,GetFavoritesModel? model)=>Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      height: 100,
      width: 100,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
           Image(
            image: NetworkImage(
                '${model.d  }'),
            height: 130.0,
            width: 125.0,
            fit: fitCover,
          ),
          // if (model?.discount!= 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              color: defaultColor,
              child:  Text(
                'model?.discount',
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
              'model?.name',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: whiteColor),
            ),
            Spacer(),
            Expanded(
              child: Row(
                children: [
                   Expanded(
                     child: Text(
                       'model?.price',
                      style: captionProduct,
                  ),
                   ),
                  sizeBoxW,
                   Expanded(
                     child: Text(
                      'model?.oldPrice',
                      style: captionProduct,
                  ),
                   ),
                  const Spacer(),
                  Expanded(
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: whiteColor,
                            size: 17,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);