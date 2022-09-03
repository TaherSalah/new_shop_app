import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../moduels/search/search_screen.dart';
import '../../shared/component/component.dart';
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
          appBar: AppBar(
            title:const Text('sallaa'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context,  const SearchScreen());
                  },
                icon:const Icon(Icons.search),
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
