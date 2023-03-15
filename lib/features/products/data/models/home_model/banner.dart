class Banner {
  int? id;
  String? image;
 

  Banner({this.id, this.image,});

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json['id'] as int?,
        image: json['image'] as String?,
     
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
      
      };
}
