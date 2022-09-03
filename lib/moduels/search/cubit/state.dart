import '../../../models/search_data_model/search_products_model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates{}

class SearchLoadingState extends SearchStates{}

class SearchSuccessState extends SearchStates{
  final SearchModel searchModel;

  SearchSuccessState(this.searchModel);

}

class SearchErrorState extends SearchStates{
  final String error;
  SearchErrorState(this.error);

}