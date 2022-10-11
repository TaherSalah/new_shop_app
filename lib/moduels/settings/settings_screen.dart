import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/states.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import 'package:softagy_shop_app/shared/cubit/cubit.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';
import '../../shared/component/constance.dart';
import '../update/update_data_screen.dart';
// ignore: must_be_immutable
class SettingesScreen extends StatefulWidget {
  const SettingesScreen({super.key});

  @override
  State<SettingesScreen> createState() => _SettingesScreenState();
}

class _SettingesScreenState extends State<SettingesScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).getUserDataModel!.data;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                if (state is ShopLoadingUpdateProfileDataState)
                  const LinearProgressIndicator(),
                // sizeBoxH,
                Column(
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
                                model!.image,
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
                    sizeBoxH,
                    Text(
                      model.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(model.email,
                        style: captionText.copyWith(color: grayColor)),
                    const SizedBox(
                      height: 5,
                    ),
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
                    ),
                    sizeBoxH,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: 125,
                          color: grayColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Settinges',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: 125,
                          color: grayColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: grayColor.withOpacity(.6),
                                    spreadRadius: 6,
                                    blurRadius: 2,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.dark_mode_outlined,
                                      size: 25,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Dark Mode',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  const Spacer(),
                                  CupertinoSwitch(
                                    activeColor: defaultColor,
                                    trackColor: blackColor,
                                    value: _switchValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _switchValue = value;
                                        ThemeCubit.get(context).changeMode();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const UpdateScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.person,
                                        size: 25,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Account Settings',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Profile Editing, Privacy, Security',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: grayColor),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: grayColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const UpdateScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  showAdaptiveActionSheet(
                                      context: context,
                                      title: Text(
                                        'Select Language',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      bottomSheetColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      androidBorderRadius: 30,
                                      cancelAction: CancelAction(
                                          title: Text(
                                        'cancel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: defaultColor),
                                      )),
                                      actions: <BottomSheetAction>[
                                        BottomSheetAction(
                                            title: Text(
                                              'Arabic',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 15),
                                            ),
                                            onPressed: (context) {
                                              Navigator.pop(context);
                                            }),
                                        BottomSheetAction(
                                            title: Text(
                                              'English',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 15),
                                            ),
                                            onPressed: (context) {
                                              Navigator.pop(context);
                                            }),
                                      ]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.green,
                                        child: Icon(
                                          Icons.language_outlined,
                                          size: 25,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Language',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Arabic , English , Etc..',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: grayColor),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: grayColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.notifications,
                                        size: 25,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Notifications',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'App Update , Newsletter .',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: grayColor),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: grayColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.delete_forever_outlined,
                                        size: 25,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Delete Account',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: grayColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        signOut(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.logout_outlined,
                                        size: 25,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Logout',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: grayColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizeBoxH,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: 125,
                          color: grayColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Feedback',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: 125,
                          color: grayColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.bug_report,
                                        size: 25,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Report A Bug',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: grayColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grayColor.withOpacity(.6),
                                      spreadRadius: 6,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.feedback_outlined,
                                        size: 25,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Send Feedback',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: grayColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
