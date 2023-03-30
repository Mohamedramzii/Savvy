import 'data.dart';

class CartModel {
  bool? status;
  dynamic message;
  Data? data;

  CartModel({this.status, this.message, this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
