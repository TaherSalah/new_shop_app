import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/home_shop_layout.dart';
import 'package:softagy_shop_app/models/add_cart_model/get_cart.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import '../../shared/styles/image.dart';
import '../../shared/styles/style.dart';

class CartProductScreen extends StatefulWidget {
  const CartProductScreen({Key? key}) : super(key: key);

  @override
  State<CartProductScreen> createState() => _CartProductScreenState();
}

class _CartProductScreenState extends State<CartProductScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  textAlign: TextAlign.center,
                  'Cart Screen',
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add_shopping_cart_outlined),
                  ),
                ],
              ),
              body: cubit.cartModel?.data == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: cartIsEmpty,
                          width: 400,
                          height: 400,
                          errorWidget: (context, url, error) =>
                              const CircularProgressIndicator(),
                        ),

               defaultTextButton(onPressed: (){
                 navigateTo(context, ShopHomeLayout(),);
               }, text: 'Click Here For Shopping')
                      ],
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildCart(
                                context,
                                cubit.cartModel!.data!.cartItems![index]
                                    .product!),
                            separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.all(4.0),
                            ),
                            itemCount: cubit.cartModel!.data != null
                                ? cubit.cartModel!.data!.cartItems!.length
                                :0,
                          )
                        ],
                      ),
                    ));
        });
  }

  Widget buildCart(context, CartProduct? model) => Padding(   
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
                                .bodyText1!
                                .copyWith(fontSize: 15.0),
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
                                    .bodyText1!
                                    .copyWith(fontSize: 14.0),

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
                                  child: Center(
                                      child: Text(
                                    '$quantity',
                                    style: const TextStyle(
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
}
