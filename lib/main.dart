import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/moduels/products_details/cubit/cubit.dart';
import 'package:softagy_shop_app/shared/cubit/cubit.dart';
import 'package:softagy_shop_app/shared/cubit/states.dart';
import 'package:softagy_shop_app/shared/network/local/cache_helper.dart';
import 'package:softagy_shop_app/shared/network/remote/dio_helper.dart';
import 'package:softagy_shop_app/shared/styles/theme.dart';
import 'layout/shop_app_layout/cubit/cubit.dart';
import 'layout/shop_app_layout/home_shop_layout.dart';
import 'moduels/on_boarding/on_boarding.dart';
import 'moduels/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool? isDark = CacheHelper.getData(key: 'isDark');
  String? tokenData = CacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (tokenData != null) {
      widget = const ShopHomeLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const BoardingScreen();
  }
  // ignore: avoid_print
  // print(tokenData);
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(() {
    runApp(MyApp(
      isDark: isDark,
      startWidget: widget,
    ));
  });
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;
  // ignore: use_key_in_widget_constructors
  const MyApp({
    this.isDark,
    this.startWidget,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..favoritesGetData()
            ..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => DetailsCubit()
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit()
            ..changeMode(
              fromShard: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ShopThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}
