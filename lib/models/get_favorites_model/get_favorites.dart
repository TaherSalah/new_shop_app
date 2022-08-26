// class GetFavoritesModel {
//   bool? status;
//   GetDataFavoritesModel? data;
//   GetFavoritesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = GetDataFavoritesModel.fromJson(json['data']);
//   }
// }
//
// class GetDataFavoritesModel {
//   int? currentPage;
//   List<GetProductFavoritesModel> productFavorites = [];
//
//   GetDataFavoritesModel.fromJson(Map<String, dynamic> json) {
//     currentPage = json['currentPage'];
//     json['data'].forEach((element) {
//       productFavorites.add(GetProductFavoritesModel.fromJson(element));
//     });
//   }
// }
//
// class GetProductFavoritesModel {
//   int? id;
//   GetProducts? product;
//
//
//   GetProductFavoritesModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     product = GetProducts.fromJson(json['product']);
//   }
// }
//
// class GetProducts {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic discount;
//   String? image;
//   String? name;
//   String? description;
//   GetProducts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
// }
//
//

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
  late String firstPageUrl;
  late  int from;
  late int lastPage;
  late String lastPageUrl;
  late String path;




  GetData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
  }


}

class Data {
  late int id;
  Product? product;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
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
