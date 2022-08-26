class GetFavoritesModel {
  bool? status;
  GetDataFavoritesModel? data;
  GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = GetDataFavoritesModel.fromJson(json['data']);
  }
}

class GetDataFavoritesModel {
  int? currentPage;
  List<GetProductFavoritesModel> productFavorites = [];

  GetDataFavoritesModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    json['data'].forEach((element) {
      productFavorites.add(GetProductFavoritesModel.fromJson(element));
    });
  }
}

class GetProductFavoritesModel {
  int? id;
  GetProducts? product;

  GetProductFavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = GetProducts.fromJson(json['product']);
  }
}

class GetProducts {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  GetProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}


