class UpdateUserModel {
  late bool status;
  ProfileDataModels? data;
  UpdateUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? ProfileDataModels.fromJson(
            json['data'],
          )
        : null;
  }
}
class ProfileDataModels {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late dynamic points;
  late dynamic credit;
  late String token;
  ProfileDataModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}

