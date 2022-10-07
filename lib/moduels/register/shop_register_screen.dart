import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/home_shop_layout.dart';
import 'package:softagy_shop_app/moduels/login/login_screen.dart';
import 'package:softagy_shop_app/moduels/products_details/cubit/cubit.dart';
import 'package:softagy_shop_app/moduels/products_details/cubit/states.dart';
import 'package:softagy_shop_app/moduels/register/cubit/state.dart';
import 'package:softagy_shop_app/shared/component/constance.dart';
import 'package:softagy_shop_app/shared/network/local/cache_helper.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';

import '../../shared/component/component.dart';
import '../../shared/component/validate.dart';
import 'cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /////////// Start Register Screen  Variables /////////////
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    /////////// End Register Screen  Variables /////////////
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.shopModel.status == true) {
              showToast(
                  text: state.shopModel.message, state: ToastStates.success);
              CacheHelper.saveData(
                key: 'token',
                value: state.shopModel.data!.token,
              ).then((value) {
                tokenData = state.shopModel.data!.token!;
                navigateTo(context, const ShopHomeLayout());
              });
            }
          }
        },
        builder: (context, state) {
          var registerCubit = ShopRegisterCubit.get(context);
          return BlocConsumer<DetailsCubit,DetailsStates>(
           listener: (context,state){},
                builder: (context,state){
               return Scaffold(
                 appBar: AppBar(),
                 body: Center(
                   child: SingleChildScrollView(
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Form(
                         key: formKey,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text(
                               'register'.toUpperCase(),
                               style: Theme.of(context).textTheme.headline5,
                             ),
                             Text(
                               'register now to browser our hot offers',
                               style: Theme.of(context)
                                   .textTheme
                                   .bodyText1
                                   ?.copyWith(color: Colors.grey),
                             ),
                             const SizedBox(
                               height: 30.0,
                             ),
                             ///////////  Start defualtFormField name /////////////
                             defualtFormField(
                               controller: nameController,
                               type: TextInputType.text,
                               prefix: Icons.person,
                               hintText: 'your Name',
                               padding: 0.0,
                               validate: Validator.name,
                             ),
                             ///////////  End defualtFormField name /////////////
                             const SizedBox(
                               height: 30.0,
                             ),
                             ///////////  Start defualtFormField Email /////////////
                             defualtFormField(
                               controller: emailController,
                               type: TextInputType.text,
                               prefix: Icons.email_outlined,
                               hintText: 'Email Address',
                               padding: 0.0,
                               validate: Validator.email,
                             ),
                             ///////////  End defualtFormField Email /////////////
                             const SizedBox(
                               height: 30.0,
                             ),
                             ///////////  Start defualtFormField password /////////////
                             defualtFormField(
                                 controller: passwordController,
                                 type: TextInputType.visiblePassword,
                                 prefix: Icons.lock_outlined,
                                 hintText: 'Password',
                                 // ignore: body_might_complete_normally_nullable
                                 onSubmitted: (value) {
                                   if (formKey.currentState!.validate()) {
                                     ShopRegisterCubit.get(context).registerUser(
                                       name: nameController.text,
                                       email: emailController.text,
                                       password: passwordController.text,
                                       phone: phoneController.text,
                                     );
                                   }
                                 },
                                 suffix: registerCubit.suffix,
                                 suffixPressed: () {
                                   registerCubit.changePasswordIcon();
                                 },
                                 isPassword: registerCubit.isPassword,
                                 padding: 0.0,
                                 validate: Validator.password),
                             ///////////  End defualtFormField password /////////////
                             const SizedBox(
                               height: 20.0,
                             ),
                             ///////////  Start defualtFormField Email /////////////
                             defualtFormField(
                               controller: phoneController,
                               type: TextInputType.phone,
                               prefix: Icons.phone,
                               hintText: 'Phone',
                               padding: 0.0,
                               validate: Validator.mobilePhone,
                             ),
                             ///////////  End defualtFormField Email /////////////
                             sizeBoxH,
                             ///////////  Start default Button Login /////////////
                             Conditional.single(
                               context: context,
                               conditionBuilder: (context) =>
                               state is! ShopRegisterLoadingState,
                               widgetBuilder: (context) => defaultButton(
                                   text: 'Register'.toUpperCase(),
                                   context: context,
                                   onPressed: () {
                                     if (formKey.currentState!.validate()) {
                                       ShopRegisterCubit.get(context).registerUser(
                                           name: nameController.text,
                                           email: emailController.text,
                                           password: passwordController.text,
                                           phone: phoneController.text);
                                     }
                                   },
                                   formKey: formKey),
                               fallbackBuilder: (context) =>
                               const CircularProgressIndicator(),
                             ),
                             ///////////  End default Button Login /////////////

                             const SizedBox(
                               height: 13.0,
                             ),
                             ///////////  Start Row login Footer /////////////
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   'Do you already have an account ?',
                                   style: Theme.of(context).textTheme.subtitle2,
                                 ),
                                 defaultTextButton(
                                     onPressed: () {
                                       navigateTo(context, const LoginScreen());
                                     },
                                     text: 'login Now'),
                               ],
                             ),
                             ///////////  End Row login Footer /////////////
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
               );
                },
              );
        },
      ),
    );
  }
}
