import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:softagy_shop_app/layout/shop_app_layout/cubit/cubit.dart';
import 'package:softagy_shop_app/moduels/search/cubit/cubit.dart';
import 'package:softagy_shop_app/moduels/search/cubit/state.dart';
import 'package:softagy_shop_app/shared/component/component.dart';

import '../../models/search_data_model/search_products_model.dart';
import '../../shared/component/ui_component.dart';
import '../../shared/styles/style.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defualtFormField(
                        onSubmitted: (String? text) {
                          SearchCubit.get(context).search(text: text!);
                          return null;
                        },
                        controller: searchController,
                        onChanged:(value){
                          SearchCubit.get(context).search(text: value);
                        },
                        type: TextInputType.text,
                        hintText: 'Search',
                        prefix: Icons.search,
                    validate: (String? value)
                    {
                        if(value != null || value!.isEmpty){
                          return 'Please Write Your Search Hint Word';
                        }
                        return null;
                    }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    if (state is SearchSuccessState)
                      Conditional.single(
                          context: context,
                          conditionBuilder: (BuildContext context) =>
                              state is! SearchLoadingState,
                          widgetBuilder: (BuildContext context) => Expanded(
                                child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        buildListItems(
                                            SearchCubit.get(context)
                                                .searchModel!
                                                .data!
                                                .data![index],
                                            context,
                                            isSearch: false),
                                    separatorBuilder: (context, index) =>
                                        Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: myDivider(),
                                        ),
                                    itemCount: SearchCubit.get(context)
                                        .searchModel!
                                        .data!
                                        .data!
                                        .length),
                              ),
                          fallbackBuilder: (BuildContext context) =>
                              Center(child: CircularProgressIndicator())),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
