import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import 'package:xstore_cubit/features/home/data/models/home_model/home_model.dart';

class CustomCarouselSliderWidget extends StatelessWidget {
  const CustomCarouselSliderWidget({
    Key? key,
    required this.homeModel,
  }) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeModel.data!.banners!.length,
      itemBuilder: (context, index, realIndex) {
        return CachedNetworkImage(
          imageUrl: homeModel.data!.banners![index].image!,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              Lottie.asset(ImagesManager.imageLoading2),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        initialPage: 0,
        height: 220.h,
        viewportFraction: 1,
      ),
    );
  }
}

/** return FadeInImage.assetNetwork(
          placeholder: ImagesManager.onBoarding1,
          image: homeModel.data!.banners![index].image!,
          width: double.infinity,
          // height: 300.h,
          fit: BoxFit.fill,
        ); */
