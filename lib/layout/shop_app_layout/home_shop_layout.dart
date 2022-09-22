import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../moduels/cart/cart_products_screen.dart';
import '../../moduels/products_details/products_details_screen.dart';
import '../../moduels/search/search_screen.dart';
import '../../shared/component/component.dart';
import '../../shared/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class ShopHomeLayout extends StatelessWidget {
  const ShopHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var homeCubit=ShopCubit.get(context);
        return Scaffold(
          // backgroundColor: Colors.deepOrangeAccent,
          appBar:  AppBar(
            elevation: 0.0,
            title:const Text('Amazon TM'),
            actions: [
              IconButton(
                  onPressed: () {
                    ThemeCubit.get(context).changeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
              IconButton(
                  onPressed: () {
                    navigateTo(context,  const SearchScreen());
                  },
                icon:const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  navigateTo(context,  const CartProductScreen());
                },
                icon:const Icon(Icons.shopping_cart),
              ),

            ],
          ),
          body: homeCubit.screenBottom[homeCubit.currentIndex],
          bottomNavigationBar:   defualtBottomNavigationBar(
              context: context,
              tabs: [
                const GButton(icon: Icons.apps,text: 'Home',),
                const GButton(icon: Icons.category_outlined,text: 'Categories',),
                const GButton(icon: Icons.favorite,text: 'Favorites',),
                const GButton(icon: Icons.settings,text: 'Settings',),
              ],
              onTabChange: (int index){
                homeCubit.changeBottom(index);
              },
              currentIndex: homeCubit.currentIndex),

        );
      },
    );
  }
}
