import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagy_shop_app/moduels/products_details/cubit/states.dart';
import 'package:softagy_shop_app/shared/component/component.dart';
import 'package:softagy_shop_app/shared/network/remote/dio_helper.dart';
import '../../../models/get_details_model/get_details.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit() : super(InitialDetailsState());
  static DetailsCubit get(context) => BlocProvider.of(context);
  DetailsModel? detailsModel;
  void getDetailsData(int productId) {
    DioHelper.getData(
        url: getDetails,
        lang: 'ar',
        token:CacheHelper.getData(key: 'token',),
    )
        .then((value) {
      detailsModel = DetailsModel.fromJson(value.data);
      emit(DetailsSuccessStates());
    }).catchError((error) {
      // ignore: avoid_print
      emit(DetailsErrorStates(error.toString()));
      // ignore: avoid_print
      print(error.toString());

    });
  }
}
