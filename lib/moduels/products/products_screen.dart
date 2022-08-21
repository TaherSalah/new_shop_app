/*****/ /////// Start Products Import package ////////*****/
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:new_shop_app/models/shop_home_model/home_model.dart';
import 'package:new_shop_app/shared/styles/style.dart';
import '../../shared/component/component.dart';
/*****/ /////// End Products Import package ////////*****/

/*****/ /////// Start Products Screen Class ////////*****/

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///////// Start Products Bloc Consumer /////////
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context).homeModel;
        return conditionalBuilder(
          context: context,
          // ignore: unnecessary_null_comparison
          ///////// Start Products conditionBuilder /////////
          conditionBuilder: (context) =>
              ShopCubit.get(context).homeModel != null,
          widgetBuilder: (context) =>
              productsBuilder(ShopCubit.get(context).homeModel),
          fallbackBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
        ///////// End Products conditionBuilder /////////
      },
    );
    ///////// End Products Bloc Consumer /////////
  }
}

/*****/ /////// End Products Screen Class ////////*****/

/*****/ /////// Start products Builder  Widget ////////*****/

Widget productsBuilder(HomeModel? model) => SingleChildScrollView(
      child: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///////// Start Products Carousel Slider /////////
              CarouselSlider(
                  items: model!.data!.banners
                      .map((e) => Image(
                            image: NetworkImage(
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
              ///////// End Products Carousel Slider /////////
              const SizedBox(
                height: 20.0,
              ),
              ///////// Start Products Grid View /////////
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.82,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  crossAxisCount: 2,
                  children: List.generate(model.data!.products.length,
                      (index) => buildGridItems(model.data!.products[index]))),
              ///////// End Products Grid View /////////
            ],
          ),
        ),
      ),
    );

/*****/ /////// End products Builder  Widget ////////*****/

/*****/ /////// Start build Grid Items  Widget ////////*****/

Widget buildGridItems(ProductsModel model) => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*****/ ///////Products Image////////*****/
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ///////// Start Products Network Image /////////
              Image(
                image: NetworkImage('${model.image}'),
                width: double.infinity,
                height: 200.0,
              ),
              ///////// End Products Network Image /////////
              ///////// Start Products Discount layer /////////
              if (model.discount != 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  color: defaultColor,
                  child: const Text(
                    'Discount',
                    style: TextStyle(fontSize: 12.5, color: Colors.white),
                  ),
                ),
              ///////// End Products Discount layer /////////
            ],
          ),
          /*****/ ///////Products Name////////*****/
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis, height: 1.5),
                ),
                /*****/ ///////Products Price & Discount////////*****/

                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style: const TextStyle(color: defaultColor),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldPrice.round()}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

/*****/ /////// End build Grid Items  Widget ////////*****/
