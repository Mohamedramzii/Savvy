import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:read_more_text/read_more_text.dart';

import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/core/constants.dart';
import 'package:xstore_cubit/features/products/presentation/viewmodel/home/home_cubit.dart';

import '../../../data/models/home_model/home_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    Key? key,
    required this.index,
    required this.homeModel,
  }) : super(key: key);

  final int index;
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        if (homeModel != null) {
          return Scaffold(
            appBar: _appbar(homeModel, index),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemCount: homeModel.data!.products![index].images.length,
                    itemBuilder: (context, indexx, realIndex) {
                      return CachedNetworkImage(
                        imageUrl:
                            homeModel.data!.products![index].images[indexx],
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
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (homeModel.data!.products![index].discount != 0)
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.green,
                                child: Text(
                                  'ON SALE ${homeModel.data!.products![index].discount}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (BlocProvider.of<HomeCubit>(context)
                                      .isConnected! ==
                                  true) {
                                cubit.changeFavorite(
                                    productID:
                                        homeModel.data!.products![index].id!);
                              } else {
                                connectionCheckerWidget(state, context);
                              }
                            },
                            icon: cubit.favorites[
                                        homeModel.data!.products![index].id!] ==
                                    true
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    // color: Colors.pink,
                                  ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      homeModel.data!.products![index].name!,
                      style: Theme.of(context).textTheme.displayMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Desciption',
                      style: TextStyle(
                          // color: ColorsManager.kprimaryColor,
                          // decoration: TextDecoration.underline,
                          fontSize: 20.sp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReadMoreText(
                      homeModel.data!.products![index].description!,
                      numLines: 6,
                      readMoreText: 'Read more',
                      readMoreAlign: Alignment.center,
                      readMoreIconColor: ColorsManager.kprimaryColor,
                      readMoreTextStyle:
                          TextStyle(color: ColorsManager.kprimaryColor),
                      readLessText: 'Read less',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Text(
                      'Price',
                      style: TextStyle(
                          // color: ColorsManager.kprimaryColor,
                          // decoration: TextDecoration.underline,
                          fontSize: 20.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(
                      children: [
                        Text(
                          '\$${homeModel.data!.products![index].price.toString()}',
                          style: TextStyle(
                              color: Colors.green,
                              // decoration: TextDecoration.underline,
                              fontSize: 20.sp),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        if (homeModel.data!.products![index].discount != 0)
                          Text(
                            '\$${homeModel.data!.products![index].oldPrice.toString()}',
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
               
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, vertical: 12.h),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        minWidth: double.infinity,
                        height: 40.h,
                        onPressed: () {
                         if(cubit.isConnected!){
                            cubit
                              .addOrRemoveCartItem(
                                  productID:
                                    homeModel.data!.products![index].id );
                         }else{
                           connectionCheckerWidget(state, context);
                         }
                        },
                        color: ColorsManager.kprimaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                             cubit.cart[homeModel
                                          .data!.products![index].id!] ==
                                      true
                                  ? ImagesManager.shoppingcartIcon
                                  : ImagesManager.emptycartIcon,
                              width: 30.w,
                              // color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              cubit.cart[homeModel
                                          .data!.products![index].id!] ==
                                      true
                                  ? 'Remove from cart'
                                  : 'Add to cart',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Getting data'),
            ),
          );
        }
      },
    );
  }

  AppBar _appbar(HomeModel model, index) {
    return AppBar(
      leading: Row(
        children: [
          SizedBox(
            width: 5.w,
          ),
          Hero(
            tag: model.data!.products![index].id.toString(),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                    model.data!.products![index].image!,
                  ))),
            ),
          ),
        ],
      ),
      title: Text(
        homeModel.data!.products![index].name!,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
