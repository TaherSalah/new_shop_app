class CartModel {
  bool? status;
  CartData? data;
  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
}

class CartData {
  dynamic subTotal;
  dynamic total;
  List<CartItems>? cartItems = [];
  CartData.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    total = json['total'];
    if (json['cart_items'] != null) {
      json['cart_items'].forEach((element) {
        cartItems!.add(CartItems.fromJson(
            element)); //////=> ضيف الي جاي من CartItems عنصر عنصر في cartItems  الي انا مجهزه فوق
      });
    }
  }
}

class CartItems {
  int? id;
  int? quantity;
  CartProduct? product;
  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = CartProduct.fromJson(json['product']);
  }
}

class CartProduct {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    description = json['description'];
  }
}
