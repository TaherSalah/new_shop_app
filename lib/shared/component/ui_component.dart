import 'package:flutter/material.dart';
import 'package:softagy_shop_app/models/get_details_model/get_details.dart';

import '../../layout/shop_app_layout/cubit/cubit.dart';
import '../../models/get_favorites_model/get_favorites.dart';
import '../../models/shop_home_model/home_model.dart';
import '../../moduels/cart/cart_products_screen.dart';
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
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ShopCubit.get(context).changFavorites(model.id);
                    },
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: ShopCubit.get(context).favorites[model.id] == true
                          ? grayColor
                          : defaultColor,
                      size: 20,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
// Widget buildProductDetails(context, DetailsData moddel) => Stack(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * .6,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//             image: NetworkImage(
//               'model!.data!.image',
//             ),
//             fit: BoxFit.fill,
//           )),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .5,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(45),
//                 topRight: Radius.circular(45),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: blackColor.withOpacity(0.5),
//                   offset: const Offset(0, -4),
//                   blurRadius: 8,
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsetsDirectional.only(top: 20, start: 20),
//                   child: Row(
//                     children: [
//                       Text(
//                         'model.data!.name',
//                         style: Theme.of(context).textTheme.headline5!.copyWith(
//                             fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                           onPressed: () {
//                             // ShopCubit.get(context).changFavorites(model.id);
//                           },
//                           icon: Icon(
//                             Icons.favorite_rounded,
//                             color: defaultColor,
//                             // color: ShopCubit.get(context)
//                             //             .favorites[model!.data!.id] ==
//                             //         true
//                             //     ? grayColor
//                             //     :
//                             size: 20,
//                           )),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.only(top: 10, start: 20),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Price : ',
//                         style: Theme.of(context).textTheme.headline5!.copyWith(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                       ),
//                       Text(
//                         '0000000',
//                         style: Theme.of(context).textTheme.headline5!.copyWith(
//                             fontWeight: FontWeight.w600, fontSize: 14),
//                       ),
//                       sizeBoxW,
//                       Text(
//                         '/  unit ',
//                         style: Theme.of(context).textTheme.headline5!.copyWith(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.only(top: 10, start: 20),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Discount : ',
//                         style: Theme.of(context).textTheme.headline5!.copyWith(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                       ),
//                       Text(
//                         'model.data!.oldPrice',
//                         style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             decoration: TextDecoration.lineThrough),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                     padding:
//                         const EdgeInsetsDirectional.only(top: 15, start: 20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color.fromRGBO(63, 200, 101, 1),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 10),
//                         child: Text(
//                           'Description',
//                           style:
//                               Theme.of(context).textTheme.subtitle2!.copyWith(
//                                     color: whiteColor,
//                                   ),
//                         ),
//                       ),
//                     )),
//                 // SizedBox(
//                 //   height: 30,
//                 // ),
//
//                 // Spacer(),
//
//
//               ],
//             ),
//           ),
//         )
//       ],
//     );
