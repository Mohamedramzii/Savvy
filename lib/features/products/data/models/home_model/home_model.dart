import 'data.dart';

class HomeModel {
  bool? status;
 
  Data? data;

  HomeModel({this.status, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'] as bool?,

        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
 
        'data': data?.toJson(),
      };
}
