import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/moduels/search/cubit/state.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import 'package:softagy_shop_app/shared/network/end_points.dart';
import 'package:softagy_shop_app/shared/network/local/cache_helper.dart';
import 'package:softagy_shop_app/shared/network/remote/dio_helper.dart';
import '../../../models/search_data_model/search_products_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void search({required String text}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: getSearch,
      token: CacheHelper.getData(key: 'token'),
      data: {
        'text': text,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      // ignore: avoid_print
      print(searchModel!.data!.data);
      emit(SearchSuccessState(searchModel!));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(SearchErrorState(error));
    });
  }
}
