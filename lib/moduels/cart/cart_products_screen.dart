import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/home_shop_layout.dart';
import 'package:softagy_shop_app/models/add_cart_model/get_cart.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import '../../shared/component/ui_component.dart';
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
                            itemBuilder: (context, index) =>buildCart(context,
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

}
