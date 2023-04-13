import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:xstore_cubit/features/products/data/models/home_model/home_model.dart';

import '../../../data/models/favorite_models/favoriteModel.dart';
import 'widgets/custom_favoriteview_listviewITEM.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    Key? key,
    required this.favoriteModel,
 
  }) : super(key: key);
  final FavoriteModel favoriteModel;

  // final List<Product> fav;
  @override
  Widget build(BuildContext context) {
    return favoriteModel.data.data!.isEmpty
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(ImagesManager.emptyfavorites)),
              Text(
                'Your favorites is empty \nAdd some now!',
                style: TextStyle(fontSize: 20.sp),
                textAlign: TextAlign.center,
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteModel.data.data!.length,
              itemBuilder: (context, index) {
                return CustomFavoritesListViewITEMWidget(favoriteModel:favoriteModel.data.data![index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5.h,
                );
              },
            ));
  }
}
