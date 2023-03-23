import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/favorite_models/favoriteModel.dart';
import 'widgets/custom_favoriteview_listviewITEM.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    Key? key,
    required this.favoriteModel,
  }) : super(key: key);
  final FavoriteModel favoriteModel;
  @override
  Widget build(BuildContext context) {
    return favoriteModel.data.data!.isEmpty
        ? Center(
            child: Text(
              'Emptyyyyyyyyyyy',
              style: TextStyle(color: Colors.black),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteModel.data.data!.length,
              itemBuilder: (context, index) {
                return CustomFavoritesListViewITEMWidget(
                    favoriteModel: favoriteModel.data.data![index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5.h,
                );
              },
            ));
  }
}
