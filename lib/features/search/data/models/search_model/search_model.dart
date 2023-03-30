import 'data.dart';

class SearchModel {
  bool? status;

  Data? data;

  SearchModel({this.status, this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );
}
