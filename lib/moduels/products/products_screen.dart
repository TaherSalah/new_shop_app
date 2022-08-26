/*****/ /////// Start Products Import package ////////*****/
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/shop_app_layout/cubit/cubit.dart';
import '../../layout/shop_app_layout/cubit/states.dart';
import '../../models/shop_categories_model/categories_model.dart';
import '../../models/shop_home_model/home_model.dart';
import '../../shared/component/component.dart';
import '../../shared/styles/style.dart';

/*****/ /////// End Products Import package ////////*****/
/*****/ /////// Start Products Screen Class ////////*****/
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///////// Start Products Bloc Consumer /////////
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        ////////////////////  for Sure add to favorites For Error message or Success Message //////////////////////
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
        // var cubit = ShopCubit.get(context).homeModel;
        return conditionalBuilder(
          context: context,
          // ignore: unnecessary_null_comparison
          ///////// Start Products conditionBuilder /////////
          conditionBuilder: (context) =>
              ShopCubit.get(context).homeModel != null &&
              ShopCubit.get(context).categoriesModel != null,
          widgetBuilder: (context) => productsBuilder(
            ShopCubit.get(context).homeModel,
            ShopCubit.get(context).categoriesModel,
            context,
          ),
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
Widget productsBuilder(
        HomeModel? model, CategoriesModel? categoriesModel, context) =>
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 15.0,
              ),
              ///////// Start Categories items  /////////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: headStyle,
                    ),
                    // ignore: sized_box_for_whitespace
                    const SizedBox(
                      height: 10.0,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 130.0,
                      width: double.infinity,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCategoriesItems(
                            categoriesModel.data!.data[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5.0,
                        ),
                        itemCount: categoriesModel!.data!.data.length,
                      ),
                    ),
                    ///////// End Categories items  /////////
                    const SizedBox(
                      height: 15.0,
                    ),
                    ///////// Start Products Grid View /////////
                    const Text(
                      'New Products',
                      style: headStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
////////////////// Grid View  //////////////////////
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.88,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  crossAxisCount: 2,
                  children: List.generate(
                      model.data!.products.length,
                      (index) => buildGridItems(
                          model.data!.products[index], context))),
              ///////// End Products Grid View /////////
            ],
          ),
        ),
      ),
    );
/*****/ /////// End products Builder  Widget ////////*****/

/*****/ /////// Start build Grid Items  Widget ////////*****/
Widget buildGridItems(ProductsModel model, context) => Container(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Row(
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
                      CircleAvatar(
                        radius: 17.0,
                        backgroundColor:
                            ShopCubit.get(context).favorites[model.id] == true
                                ? defaultColor
                                : Colors.grey,
                        child: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).changFavorites(model.id!);
                            },
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: whiteColor,
                              size: 17,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
/*****/ /////// End build Grid Items  Widget ////////*****/

/*****/ /////// Start build Categories Items  Widget ////////*****/
Widget buildCategoriesItems(DataModel model) => Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          height: 130.0,
          width: 125.0,
          fit: fitCover,
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: Colors.grey.withOpacity(0.7),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            textAlign: TextAlign.center,
            '${model.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
/*****/ /////// End build Categories Items  Widget ////////*****/
