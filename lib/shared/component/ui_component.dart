import 'package:flutter/material.dart';

import '../../layout/shop_app_layout/cubit/cubit.dart';
import '../../models/get_favorites_model/get_favorites.dart';
import '../../moduels/products_details/products_details_screen.dart';
import '../styles/style.dart';
import 'component.dart';

Widget buildListItems(model, context, {bool isSearch = true}) => Row(

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

                    '${model.image}'),

                height: 130.0,

                width: 125.0,

              ),

              if (model.discount != 0 && isSearch)

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

        SizedBox(

          width: 10.0,

        ),

        Expanded(

          child: Container(

            height: 100,

            width: 100,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(

                  model.name!,

                  maxLines: 2,

                  overflow: TextOverflow.ellipsis,

                  style: Theme.of(context)

                      .textTheme

                      .bodyText1!

                      .copyWith(fontSize: 15.0),



                  // TextStyle(

                  //     overflow: TextOverflow.ellipsis, height: 1.5),

                ),

                const Spacer(),

                Expanded(

                  child: Row(

                    children: [

                      Text(

                        '${model.price}',

                        style: Theme.of(context).textTheme.subtitle2,

                      ),

                      sizeBoxW,

                      if (model.discount != 0 && isSearch)

                        Text(

                          '${model.oldPrice}',

                          style: const TextStyle(

                              fontSize: 14,

                              fontWeight: FontWeight.bold,

                              color: Colors.grey,

                              decoration: TextDecoration.lineThrough),

                        ),

                      const Spacer(),

                      IconButton(

                          onPressed: () {

                            ShopCubit.get(context).changFavorites(model.id);

                          },

                          icon: Icon(

                            Icons.favorite_rounded,

                            color: ShopCubit.get(context).favorites[model.id] ==

                                    true

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
