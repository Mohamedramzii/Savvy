class FavoriteIConModel{
 bool? status;
 String? message;
 FavoriteIConModel.fromJson(Map<String,dynamic> json){

   status=json['status'];
   message=json['message'];
 }
}