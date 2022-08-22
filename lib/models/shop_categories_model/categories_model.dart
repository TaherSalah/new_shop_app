
////// Start Categories Model Class //////
class CategoriesModel {
  bool? status;
  CategoriesDataModel? data;

////// start Categories Model named constructor //////
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
////// End Categories Model named constructor //////
}
////// End Categories Model Class //////

////// Start Categories Data Model Class //////
class CategoriesDataModel {
  int? currentPage;
  List<DataModel> data = []; //////// Create empty List For Add Data  /////////

////// start Categories Data Model named constructor //////
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    ///////// Start ForEach Method For Data List ////////////
    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
////// End Categories Data Model named constructor //////
}
////// End Categories Data Model Class //////

////// start Data Model Class //////
class DataModel {
  int? id;
  String? name;
  String? image;

  ////// start Data Model named constructor //////
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
////// End Data Model named constructor //////

}
////// End Data Model Class //////
