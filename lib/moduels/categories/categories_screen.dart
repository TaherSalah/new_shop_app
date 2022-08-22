import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:new_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:new_shop_app/models/shop_categories_model/categories_model.dart';
import 'package:new_shop_app/shared/component/component.dart';
import 'package:new_shop_app/shared/styles/style.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ShopCubit.get(context).categoriesModel!.data;
        return ListView.separated(
          itemBuilder: (context, index) => buildCategoriesScreen(cubit!.data[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: cubit!.data.length,
        );
      },
    );
  }
}

Widget buildCategoriesScreen(DataModel model) => Padding(
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
          SizedBox(width: 10.0,),
          Text(
           ' ${model.name}',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
