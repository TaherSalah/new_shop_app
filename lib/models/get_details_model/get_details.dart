class DetailsModel{
   bool? status ;
  DetailsData? data;
  DetailsModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data=json['data']!=null?DetailsData.fromJson(json['data']):null;
  }
}
class DetailsData{
 late  int id;
 dynamic price;
   dynamic oldPrice;
   dynamic discount;
  String? image;
   String? name;
  String? description;
 // late List <String> images;
DetailsData.fromJson(Map<String,dynamic>json){
  id=json['id'];
  price=json['price'];
  oldPrice = json['old_price'];
  discount=json['discount'];
  image=json['image'];
  name=json['name'];
  description=json['description'];
  // images=json['images'].cast<String>();
}
}

