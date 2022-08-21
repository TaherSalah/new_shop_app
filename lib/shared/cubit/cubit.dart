import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/shared/cubit/states.dart';

import '../network/local/cache_helper.dart';



  ////// dark theme cubit //////
  class ThemeCubit extends Cubit<ShopThemeStates> {
  ThemeCubit() : super(InitialShopState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  ThemeMode darkTheme = ThemeMode.dark;
  void changeMode({bool? fromShard}) {
  if (fromShard != null) {
  isDark = fromShard;
  emit(ChangeModeState());
  } else {
  isDark = !isDark;
  CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
  emit(ChangeModeState());
  });
  }
  }
  }
