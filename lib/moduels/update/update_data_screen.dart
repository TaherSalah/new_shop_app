import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';

import '../../shared/component/component.dart';
import '../../shared/styles/style.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).getUserDataModel!.data;
        nameController.text = model!.name;
        emailController.text = model.email;
        phoneController.text = model.phone;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update your Profile',
              style: headStyle,
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // child: Hero(tag: model.id, child: ),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0.2,
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: defaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ShopCubit.get(context).updateData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text);
                        }
                      },
                      text: 'Update Data',
                      context: context,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
