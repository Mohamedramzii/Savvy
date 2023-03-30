import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/favorite_models/favoriteModel.dart';
import 'widgets/custom_favoriteview_listviewITEM.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    Key? key,
    required this.fav,
  }) : super(key: key);
  // final FavoriteModel favoriteModel;
  final List<Product> fav;
  @override
  Widget build(BuildContext context) {
    return fav.isEmpty
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
              itemCount: fav.length,
              itemBuilder: (context, index) {
                return CustomFavoritesListViewITEMWidget(fav: fav[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5.h,
                );
              },
            ));
  }
}
