import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:xstore_cubit/features/search/data/models/search_model/search_model.dart';

import '../../../../../../core/app_managers/assets_manager.dart';
import '../../../../data/models/favorite_models/favoriteModel.dart';
import '../../../viewmodel/home/home_cubit.dart';

class CustomFavoritesListViewITEMWidget extends StatelessWidget {
  CustomFavoritesListViewITEMWidget({
    Key? key,
    // this.searchModel
    required this.fav,
  }) : super(key: key);

  // final Datum favoriteModel;
  final Product fav;
  // SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: fav.image!,
                width: 140.w,
                height: 130.h,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Lottie.asset(ImagesManager.imageLoading2),
              ),
              if (fav.discount != 0)
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.green,
                    child: Text(
                      'ON SALE',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
            ],
          ),
          SizedBox(
            width: 200.w,
            height: 120.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fav.name!,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'EGP ${fav.price!.round().toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.green, fontSize: 20),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      if (fav.discount != 0)
                        Text(
                          'EGP ${fav.oldPrice!.round().toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13),
                        ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context)
                              .addOrRemoveFavorites(
                                  productID: fav.id.toString());
                        },
                        icon: BlocProvider.of<HomeCubit>(context)
                                .favoritesID
                                .contains(fav.id.toString())
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                      ),
                      // IconButton(
                      //   padding: EdgeInsets.zero,
                      //   onPressed: () {
                      //     BlocProvider.of<HomeCubit>(context).changeFavorite(
                      //         productID: fav.id!);
                      //   },
                      //   icon: BlocProvider.of<HomeCubit>(context)
                      //               .favorites[fav.id] ==
                      //           true
                      //       ? const Icon(
                      //           Icons.favorite,
                      //           color: Colors.red,
                      //         )
                      //       : const Icon(Icons.favorite_border),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
