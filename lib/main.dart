import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/shared/cubit/cubit.dart';
import 'package:new_shop_app/shared/cubit/states.dart';
import 'package:new_shop_app/shared/network/local/cache_helper.dart';
import 'package:new_shop_app/shared/network/remote/dio_helper.dart';
import 'package:new_shop_app/shared/styles/theme.dart';

import 'layout/shop_app_layout/on_boarding.dart';

void main() async {
  ////// بتأكد ان كل حاجه هنا في اmethod خلصت وبعدين بيفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  BlocOverrides.runZoned(() {
    runApp(MyApp(isDark));
  });
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  // ignore: use_key_in_widget_constructors
  const MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(  create: (context) => ThemeCubit()
          ..changeMode(
            fromShard: isDark,
          ),),
      ],
      child: BlocConsumer<ThemeCubit,ShopLoginStates>(
        listener: (context, state) {},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: ThemeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const BoardingScreen()
          );
        },
      ),
    );
  }
}
