import 'package:cached_network_image/cached_network_image.dart';
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
Widget buildCart(context,model)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  offset: const Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: '${model!.image}',
                width: 110,
                height: 110,
                errorWidget: (context, url, error) =>
                const Center(child: CircularProgressIndicator()),
                placeholder: (context, url) =>
                const Center(child: Text('Product image')),
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16.0,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '${model.price.round()}\$',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 14.0,fontWeight: FontWeight.bold),

                          // TextStyle(

                          //     overflow: TextOverflow.ellipsis, height: 1.5),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        if (model.discount != 0)
                          Text(
                            '${model.oldPrice}\$',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                fontSize: 14.0,
                                color: grayColor,
                                fontWeight: FontWeight.w500,
                                decoration:
                                TextDecoration.lineThrough),

                            // TextStyle(

                            //     overflow: TextOverflow.ellipsis, height: 1.5),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            // setState(() {
                            //   quantity--;
                            // });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            print('plus');
                            // setState(() {
                            //   quantity++;
                            // });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        if (model.discount != 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/5305/5305244.png',
                              errorWidget: (context, url, error) =>
                              const CircularProgressIndicator(),
                              height: 50,
                              width: 50,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            maxRadius: 20,
                            backgroundColor: grayColor.withOpacity(.5),
                            child: const Icon(Icons.favorite,
                                size: 22, color: defaultColor),
                          ),
                          onTap: () {
                            ShopCubit.get(context)
                                .changFavorites(model.id!);
                          },
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        GestureDetector(
                          child: CircleAvatar(
                            maxRadius: 20,
                            backgroundColor: grayColor.withOpacity(.5),
                            child: const Icon(Icons.delete_rounded,
                                size: 22, color: Colors.red),
                          ),
                          onTap: () {
                            ShopCubit.get(context)
                                .changeCart(productId: model.id!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);

Widget buildFav(context,model)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  offset: const Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: '${model!.image}',
                width: 110,
                height: 110,
                errorWidget: (context, url, error) =>
                const Center(child: CircularProgressIndicator()),
                placeholder: (context, url) =>
                const Center(child: Text('Product image')),
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16.0,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '${model.price.round()}\$',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 14.0,fontWeight: FontWeight.bold),

                          // TextStyle(

                          //     overflow: TextOverflow.ellipsis, height: 1.5),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        if (model.discount != 0)
                          Text(
                            '${model.oldPrice}\$',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                fontSize: 14.0,
                                color: grayColor,
                                fontWeight: FontWeight.w500,
                                decoration:
                                TextDecoration.lineThrough),

                            // TextStyle(

                            //     overflow: TextOverflow.ellipsis, height: 1.5),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            // setState(() {
                            //   quantity--;
                            // });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            print('plus');
                            // setState(() {
                            //   quantity++;
                            // });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        if (model.discount != 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/5305/5305244.png',
                              errorWidget: (context, url, error) =>
                              const CircularProgressIndicator(),
                              height: 50,
                              width: 50,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            maxRadius: 20,
                            backgroundColor: grayColor.withOpacity(.5),
                            child: const Icon(Icons.add_shopping_cart,
                                size: 22, color: defaultColor),
                          ),
                          onTap: () {
                            ShopCubit.get(context).changeCart(productId: model.id);
                          },
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        GestureDetector(
                          child: CircleAvatar(
                            maxRadius: 20,
                            backgroundColor: grayColor.withOpacity(.5),
                            child: const Icon(Icons.delete_rounded,
                                size: 22, color: Colors.red),
                          ),
                          onTap: () {
                            ShopCubit.get(context)
                                .changFavorites( model.id!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);