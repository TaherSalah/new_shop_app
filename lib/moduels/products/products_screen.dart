import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:new_shop_app/models/shop_home_model/home_model.dart';

import '../../shared/component/component.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit=ShopCubit.get(context).homeModel();
        return conditionalBuilder(
          context: context,
          // ignore: unnecessary_null_comparison
          conditionBuilder: (context) =>
              ShopCubit.get(context).homeModel != null,
          widgetBuilder: (context) =>
              productsBuilder(ShopCubit.get(context).homeModel),
          fallbackBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget productsBuilder(HomeModel? model) => Column(
      children: [
        CarouselSlider(
            items: model!.data!.banners
                .map((e) => Image(
                image:
            NetworkImage(
                '${e.image}',
            ),
             fit: BoxFit.cover,
             width: double.infinity,
            ))
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayInterval: const Duration(seconds: 3),
              reverse: false,
              viewportFraction: 1.0,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,

            )),
      ],
    );
