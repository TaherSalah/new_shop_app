import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:softagy_shop_app/moduels/login/cubit/state.dart';
import 'package:softagy_shop_app/moduels/register/cubit/state.dart';
import '../../../models/shop_login_model/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

///////////  Start ShopLoginCubit Cubit /////////////
class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ///////////  Constructor ShopLoginCubit Cubit Start /////////////
  ShopRegisterCubit(): super(ShopRegisterIntialState());
  ShopModel? shopModel;
  ///////////  Constructor ShopLoginCubit Cubit  End /////////////

  ///////////   ShopLoginCubit Object Start /////////////
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
  ///////////   ShopLoginCubit Object End /////////////


  ///////////  Start  login User Method /////////////
  void registerUser({
  required String name,
    required String email,
    required String password,
    required String phone,
})
{
  emit(ShopRegisterLoadingState());
  ///////// post data /////////
  DioHelper.postData(
      url: register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }
  ).then((value) {
    // ignore: avoid_print
    shopModel=ShopModel.fromJson(value.data);
    emit(ShopRegisterSuccessState(shopModel!));
  }).catchError((error){
    // ignore: avoid_print
    print(error.toString());
    emit(ShopRegisterErrorState(error.toString()));
  });
}
  ///////////  End  login User Method /////////////


  ///////////  Start  change Password Icon Method /////////////

  bool isPassword=true;
  IconData suffix=Icons.remove_red_eye_outlined;
  void changePasswordIcon(){
    isPassword = !isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShopRegisterVisibilityPasswordState());
  }
///////////  End  change Password Icon Method /////////////

}
