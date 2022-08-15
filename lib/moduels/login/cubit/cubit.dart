import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_shop_app/moduels/login/cubit/state.dart';
import 'package:new_shop_app/shared/network/remote/dio_helper.dart';
import '../../../shared/network/end_points.dart';

///////////  Start ShopLoginCubit Cubit /////////////
class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ///////////  Constructor ShopLoginCubit Cubit Start /////////////
  ShopLoginCubit(): super(ShopLoginIntialState());
  ///////////  Constructor ShopLoginCubit Cubit  End /////////////

  ///////////   ShopLoginCubit Object Start /////////////
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  ///////////   ShopLoginCubit Object End /////////////

  ///////////  Start  login User Method /////////////
  void loginUser({
  required String email,
  required String password
})
{
  emit(ShopLoginLoadingState());
  ///////// post data /////////
  DioHelper.postData(
      url: loginPoints,
      data: {
        'email': email,
        'password': password,
      }
  ).then((value) {
    // ignore: avoid_print
    print(value.data);
    emit(ShopLoginSuccessState());
  }).catchError((error){
    // ignore: avoid_print
    print(error.toString());
    emit(ShopLoginErrorState(error.toString()));
  });
}
  ///////////  End  login User Method /////////////


  ///////////  Start  change Password Icon Method /////////////

  bool isPassword=true;
  IconData suffix=Icons.remove_red_eye_outlined;
  void changePasswordIcon(){
    isPassword = !isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShopLoginVisibilityPasswordState());
  }
///////////  End  change Password Icon Method /////////////

}
