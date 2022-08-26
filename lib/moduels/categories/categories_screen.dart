import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/shop_app_layout/cubit/cubit.dart';
import '../../layout/shop_app_layout/cubit/states.dart';
import '../../models/shop_categories_model/categories_model.dart';
import '../../shared/component/component.dart';
import '../../shared/styles/style.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ShopCubit.get(context).categoriesModel!.data;
        return ListView.separated(
          itemBuilder: (context, index) => buildCategoriesScreen(cubit.data[index],context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: cubit!.data.length,
        );
      },
    );
  }
}

Widget buildCategoriesScreen(DataModel model,context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children:  [
          Image(
            image: NetworkImage(
                '${model.image}'),
            width: 120.0,
            height: 120.0,
            fit: fitCover,
          ),
          const SizedBox(width: 10.0,),
          Text(
           ' ${model.name}',
            style:Theme.of(context).textTheme.bodyText1,

          ),
          const Spacer(),
           const Icon(Icons.arrow_forward_ios,)
        ],
      ),
    );
