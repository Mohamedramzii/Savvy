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

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

// class LoginModel {
//   LoginModel({
//     required this.status,
//     required this.message,
//     required this.userData,
//   });

//   bool? status;
//   String? message;
//   UserData? userData;

//    LoginModel.fromJson(Map<String, dynamic> json){
//         status= json["status"];
//         message= json["message"];
//         userData= UserData.fromJson(json["data"]);
//   }
// }

// class UserData {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;

//   UserData.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     email = json["email"];
//     phone = json["phone"];
//     image = json["image"];
//     points = json["points"];
//     credit = json["credit"];
//     token = json["token"];
//   }
// }
