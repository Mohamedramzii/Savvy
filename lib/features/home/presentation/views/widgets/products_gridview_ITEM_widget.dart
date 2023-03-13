import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/app_managers/assets_manager.dart';
import '../../../data/models/home_model/home_model.dart';

class ProductsGridViewItemsWidget extends StatelessWidget {
  const ProductsGridViewItemsWidget({
    Key? key,
    required this.homeModel,
    required this.index,
  }) : super(key: key);
  final HomeModel homeModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CachedNetworkImage(
                    imageUrl: homeModel.data!.products![index].image!,
                     width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        Lottie.asset(ImagesManager.imageLoading2),
                  )
                  ),
              if (homeModel.data!.products![index].discount != 0)
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            child: Text(
              homeModel.data!.products![index].name!,
              style: Theme.of(context).textTheme.displaySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Text(
                  'EGP ${homeModel.data!.products![index].price!.round().toString()}',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.green),
                ),
                SizedBox(
                  width: 3.w,
                ),
                if (homeModel.data!.products![index].discount != 0)
                  Text(
                    'EGP ${homeModel.data!.products![index].oldPrice!.round().toString()}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13),
                  ),
                const Spacer(),
                Expanded(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
