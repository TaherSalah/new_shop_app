import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:new_shop_app/moduels/login/cubit/cubit.dart';
import 'package:new_shop_app/moduels/login/cubit/state.dart';
import 'package:new_shop_app/shared/component/component.dart';
import '../../shared/component/validate.dart';
import '../register/shop_register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                          'login'.toUpperCase(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'login now to browser our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defualtFormField(
                          controller: emailController,
                          type: TextInputType.text,
                          prefix: Icons.email_outlined,
                          hintText: 'Email Address',
                          padding: 0.0,
                          validate: Validator.email,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defualtFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            prefix: Icons.lock_outlined,
                            hintText: 'Password',
                            // ignore: body_might_complete_normally_nullable
                            onSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).loginUser(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            suffix:ShopLoginCubit.get(context).suffix,
                            suffixPressed: (){
                              ShopLoginCubit.get(context).changePasswordIcon();
                            },
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            padding: 0.0,
                            validate: Validator.password),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! ShopLoginLoadingState,
                          widgetBuilder: (context) => defaultButton(
                              context: context,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).loginUser(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              formKey: formKey),
                          fallbackBuilder: (context) =>
                              const CircularProgressIndicator(),
                        ),
                        const SizedBox(
                          height: 13.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ? ',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            defaultTextButton(
                                onPressed: () {
                                  navigateTo(context, const RegisterScreen());
                                },
                                text: 'Register Now'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
