class CategoriesModel
{
  bool? status;

}
class CategoriesDataModel
{
int?  currentPage;

}
////// start Data Model Class //////
class DataModel
{
  int? id;
  String? name;
  String? image;

  ////// start Data Model named constructor //////
  DataModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
////// End Data Model named constructor //////

}
////// End Data Model Class //////
