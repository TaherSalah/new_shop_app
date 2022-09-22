import 'package:flutter/material.dart';
import 'package:softagy_shop_app/moduels/cart/cart_products_screen.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';

import '../../shared/component/component.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({Key? key}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration:  BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg'),
              fit: BoxFit.fill,
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.5),
                    offset: const Offset(0, -4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 20, start: 20),
                    child: Row(
                      children: [
                        Text(
                          'Apple MacBook Pro',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              // ShopCubit.get(context).changFavorites(model.id);
                            },
                            icon: const Icon(
                              Icons.favorite_rounded,
                              color: grayColor,
                              // color: ShopCubit.get(context).favorites[model.id] ==
                              //     true
                              //     ? grayColor
                              //     : defaultColor,
                              size: 25,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 10, start: 20),
                    child: Row(
                      children: [
                        Text(
                          'Price : ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          '25.0000',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        sizeBoxW,
                        Text(
                          '/  unit ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 10, start: 20),
                    child: Row(
                      children: [
                        Text(
                          'Discount : ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const Text(
                          '24.0000',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 15, start: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(63, 200, 101, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'Shipped product From Application',
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: whiteColor,
                                    ),
                          ),
                        ),
                      )),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: defaultColor,
                          ),
                          child: const Center(
                              child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: const Center(
                              child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  myDivider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                              ),
                              sizeBoxH,
                              Text('IDR : 25.0000',  style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize:14),),
                            ],
                          ),
                        ),
                        const Spacer(),
                        defaultSmallButton(
                            onPressed: () {
                             navigateTo(context, CartProductScreen());
                            },
                            text: 'Add to Cart',
                            context: context)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
