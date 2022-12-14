//////////////////////////////////  Home Model //////////////////////////////////////////////
class HomeModel {
  bool? status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

//////////////////////////////////  Home Data Model //////////////////////////////////////////////
class HomeDataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    // ignore: avoid_function_literals_in_foreach_calls
    json['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(ProductsModel.fromJson(element));
    });
  }
}

//////////////////////////////////  Banners Model //////////////////////////////////////////////
class BannersModel {
  int? id;
  String? image;
  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

//////////////////////////////////  Products Model //////////////////////////////////////////////
class ProductsModel {
  late int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  late String description;

  bool? inFavorites;
  late bool inCart;
  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
