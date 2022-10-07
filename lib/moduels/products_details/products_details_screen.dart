import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';
import '../../models/shop_home_model/home_model.dart';
import '../../shared/styles/image.dart';

class SHowItemProduct extends StatelessWidget {
  final ProductsModel model;
  const SHowItemProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        return Scaffold(
            body: buildShowImageProduct(context),
        );
      },
    );
  }

  Widget buildShowImageProduct(context) => Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            child: Hero(
              tag: model.id,
              child: Center(
                child: FadeInImage.assetNetwork(
                  image: model.image!,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: imageLoading,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
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
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 20, start: 20),
                        child: Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  model.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    ShopCubit.get(context)
                                        .changFavorites(model.id);
                                  },
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color: ShopCubit.get(context)
                                                .favorites[model.id] ==
                                            true
                                        ? defaultColor
                                        : grayColor,
                                    size: 25,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 10, start: 20),
                        child: Row(
                          children: [
                            Text(
                              'Price : ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                            ),
                            Text(
                              model.price.toString()!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                            ),
                            sizeBoxW,
                            Text(
                              '/  unit ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 10, start: 20),
                        child: Row(
                          children: [
                            Text(
                              'Discount : ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                            ),
                            Text(
                              model.oldPrice.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 15, start: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(63, 200, 101, 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(
                                'Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: whiteColor,
                                    ),
                              ),
                            ),
                          )),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            model.description,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      )
                      // SizedBox(
                      //   height: 30,
                      // ),

                      // Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
