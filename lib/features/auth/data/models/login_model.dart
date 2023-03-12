class LoginModel {
  bool? status;
  String? message;
  UserData? userData;
  LoginModel({
    this.status,
    this.message,
    this.userData,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? imageurl;
  String? token;
  int? points;
  int? credit;

  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.imageurl,
  //   this.token,
  //   this.points,
  //   this.credit,
  // });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageurl = json['image'];
    token = json['token'];
    points = json['points'];
    credit = json['credit'];
  }
}
