
class GetFavoritesModel {
 late bool status;
  GetData? data;
  GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? GetData.fromJson(json['data']) : null;
  }
}
class GetData {
  late int currentPage;
  late List<Data> data;
  GetData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
      });
    }
  }
}
class Data {
  late int id;
  Product? product;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ?  Product.fromJson(json['product']) : null;
  }
}
class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late  String image;
  late  String name;
  late String description;
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
