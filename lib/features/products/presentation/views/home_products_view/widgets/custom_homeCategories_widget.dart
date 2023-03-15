import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import '../../../../../categories/data/models/homeCategoriesModel.dart';

class CustomHomeCategoriesItem extends StatelessWidget {
  const CustomHomeCategoriesItem({
    Key? key,
    required this.homeCategoriesModel,
  }) : super(key: key);
  final Datum homeCategoriesModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CachedNetworkImage(
            imageUrl: homeCategoriesModel.image,
            width: 130.w,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Lottie.asset(ImagesManager.imageLoading2),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            color: Colors.black.withOpacity(.7),
            width: 130.w,
            child: Text(homeCategoriesModel.name.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
