
import 'dart:convert';

HomeCategoriesModel homeCategoriesModelFromJson(String str) => HomeCategoriesModel.fromJson(json.decode(str));

String homeCategoriesModelToJson(HomeCategoriesModel data) => json.encode(data.toJson());

class HomeCategoriesModel {
    HomeCategoriesModel({
        required this.status,
        required this.data,
    });

    bool status;
    Data data;

    factory HomeCategoriesModel.fromJson(Map<String, dynamic> json) => HomeCategoriesModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.currentPage,
        required this.data,
    });

    int currentPage;
    List<Datum> data;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.image,
    });

    int id;
    String name;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
