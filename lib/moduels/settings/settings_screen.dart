import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import 'package:softagy_shop_app/shared/component/constance.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';

// ignore: must_be_immutable
class SettingesScreen extends StatelessWidget {
  SettingesScreen({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).getUserDataModel!.data;
        nameController.text = model!.name;
        emailController.text = model.email;
        phoneController.text = model.phone;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                if (state is ShopLoadingUpdateProfileDataState)
                  const LinearProgressIndicator(),
                sizeBoxH,
                Column(
                  children: [
                    CircleAvatar(
                        radius: 70.0,
                        backgroundImage: NetworkImage(
                          model.image,
                        )),
                    sizeBoxH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Points : ',
                          style: captionText.copyWith(color: grayColor),
                        ),
                        Text('${model.credit}',
                            style: captionText.copyWith(color: grayColor)),
                        sizeBoxW,
                        Text(
                          'Credit : ',
                          style: captionText.copyWith(color: grayColor),
                        ),
                        Text(
                          '${model.credit}',
                          style: captionText.copyWith(color: grayColor),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    defualtFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        hintText: 'Name',
                        prefix: Icons.person),
                    defualtFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        hintText: 'E-mail',
                        prefix: Icons.email_outlined),
                    defualtFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        hintText: 'Phone',
                        prefix: Icons.phone),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: defaultButton(
                        text: 'update'.toUpperCase(),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ShopCubit.get(context).updateData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        context: context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: defaultButton(
                        text: 'sign out'.toUpperCase(),
                        onPressed: () {
                          signOut(context);
                        },
                        context: context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
