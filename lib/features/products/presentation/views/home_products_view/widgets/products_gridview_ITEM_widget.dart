import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:xstore_cubit/features/Auth/presentation/views/widgets/custom_Toast_Widget.dart';

import 'package:xstore_cubit/features/products/presentation/views/details_view/detailsView.dart';

import '../../../../../../core/app_managers/assets_manager.dart';
import '../../../../../../core/constants.dart';
import '../../../../data/models/home_model/home_model.dart';
import '../../../viewmodel/home/home_cubit.dart';

class ProductsGridViewItemsWidget extends StatelessWidget {
  const ProductsGridViewItemsWidget({
    Key? key,
    required this.homeModel,
    required this.index,
    required this.state,
  }) : super(key: key);
  final HomeModel homeModel;
  final int index;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.navigationWithReturn(context,
            screen: DetailsView(index: index, homeModel: homeModel));
      },
      child: Container(
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
                  child: Hero(
                    tag: homeModel.data!.products![index].id.toString(),
                    child: CachedNetworkImage(
                      imageUrl: homeModel.data!.products![index].image!,
                      width: double.infinity,
                      height: 180.h,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Lottie.asset(ImagesManager.imageLoading2),
                    ),
                  ),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Text(
                  homeModel.data!.products![index].name!,
                  style: Theme.of(context).textTheme.displaySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                  // Expanded(
                  //   child: IconButton(
                  //     padding: EdgeInsets.zero,
                  //     onPressed: () {
                  //       if (BlocProvider.of<HomeCubit>(context).isConnected! ==
                  //           true) {
                  //         BlocProvider.of<HomeCubit>(context)
                  //             .addOrRemoveFavorites(
                  //                 productID: homeModel
                  //                     .data!.products![index].id!
                  //                     .toString());
                  //       } else {
                  //         connectionCheckerWidget(state, context);
                  //       }
                  //     },
                  //     icon: BlocProvider.of<HomeCubit>(context)
                  //             .favoritesID
                  //             .contains(homeModel.data!.products![index].id!
                  //                 .toString())
                  //
                  //             ? const Icon(
                  //                 Icons.favorite,
                  //                 color: Colors.red,
                  //               )
                  //         : const Icon(Icons.favorite_border),
                  //   ),
                  // )
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (BlocProvider.of<HomeCubit>(context).isConnected!) {
                          BlocProvider.of<HomeCubit>(context).changeFavorite(
                              productID: homeModel.data!.products![index].id!);
                        } else {
                          connectionCheckerWidget(state, context);
                        }
                      },
                      icon: BlocProvider.of<HomeCubit>(context).favorites[
                                  homeModel.data!.products![index].id] ==
                              true
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // void _CheckConnectedOrNotToAddOrRemoveFavorites(BuildContext context,state) {
  //   if (state is AppInternetConnectionConnected) {
  //     BlocProvider.of<HomeCubit>(context).addOrRemoveFavorites(
  //         productID: homeModel.data!.products![index].id!.toString());
  //   } else if (state is AppInternetConnectionNone) {
  //     connectionCheckerWidget(state, context);
  //   }
  // }
}
