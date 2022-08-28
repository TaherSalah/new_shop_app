import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /////////// Start Register Screen  Variables /////////////
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    /////////// End Register Screen  Variables /////////////
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
                          ShopLoginCubit.get(context).loginUser(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      suffix: loginCubit.suffix,
                      suffixPressed: () {
                        loginCubit.changePasswordIcon();
                      },
                      isPassword: loginCubit.isPassword,
                      padding: 0.0,
                      validate: Validator.password),
                  ///////////  End defualtFormField password /////////////
                  const SizedBox(
                    height: 20.0,
                  ),
                  ///////////  Start default Button Login /////////////
                  Conditional.single(
                    context: context,
                    conditionBuilder: (context) =>
                    state is! ShopLoginLoadingState,
                    widgetBuilder: (context) => defaultButton(
                        text: 'login'.toUpperCase(),
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
                  ///////////  End default Button Login /////////////

                  const SizedBox(
                    height: 13.0,
                  ),
                  ///////////  Start Row login Footer /////////////
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
                  ///////////  End Row login Footer /////////////
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
