import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:xstore_cubit/features/search/data/models/search_model/datum.dart';
import '../../../../../../core/app_managers/assets_manager.dart';

class CustomSearchListViewITEMWidget extends StatelessWidget {
  CustomSearchListViewITEMWidget({Key? key, required this.searchModel})
      : super(key: key);

  Datum? searchModel;

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
                imageUrl: searchModel!.image!,
                width: 140.w,
                height: 130.h,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Lottie.asset(ImagesManager.imageLoading2),
              ),
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
                    searchModel!.name!,
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
                        'EGP ${searchModel!.price!.round().toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.green, fontSize: 20),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
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
