import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            image: DecorationImage(
                              image: NetworkImage(
                                model.image,
                              ),
                              fit: BoxFit.cover,
                            ),
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
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor)),
                            )),
                        sizeBoxH,
                      ],
                    ),
                    SizedBox(
                      height: 30,
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
                      padding: const EdgeInsets.all(30.0),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
