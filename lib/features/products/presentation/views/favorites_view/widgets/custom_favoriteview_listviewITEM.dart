import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/app_managers/assets_manager.dart';
import '../../../../data/models/favorite_models/favoriteModel.dart';
import '../../../viewmodel/home/home_cubit.dart';

class CustomFavoritesListViewITEMWidget extends StatelessWidget {
  const CustomFavoritesListViewITEMWidget({
    Key? key,
    // this.searchModel
    required this.favoriteModel,
  }) : super(key: key);

  final Datum favoriteModel;

  // final Product fav;
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
                imageUrl: favoriteModel.product!.image!,
                width: 140.w,
                height: 130.h,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Lottie.asset(ImagesManager.imageLoading2),
              ),
              if (favoriteModel.product!.discount != 0)
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
                    favoriteModel.product!.name!,
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
                        'EGP ${favoriteModel.product!.price!.round().toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.green, fontSize: 20),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      if (favoriteModel.product!.discount != 0)
                        Text(
                          'EGP ${favoriteModel.product!.oldPrice!.round().toString()}',
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
                            print('pressed');

                            BlocProvider.of<HomeCubit>(context).changeFavorite(
                                productID: favoriteModel.product!.id!);
                          },
                          icon:const Icon(Icons.delete,color: Colors.red,)),
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
