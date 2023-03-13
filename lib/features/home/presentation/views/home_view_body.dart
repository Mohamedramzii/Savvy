import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/home/presentation/views/widgets/custom_carousel_widget.dart';
import 'package:xstore_cubit/features/home/presentation/views/widgets/custom_homeCategories_Listview_widget.dart';
import 'package:xstore_cubit/features/home/presentation/views/widgets/products_gridview_widget.dart';

import '../../../categories/data/models/homeCategoriesModel.dart';
import '../../data/models/home_model/home_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
    required this.homeModel,
    required this.homeCategoriesModel,
  }) : super(key: key);
  final HomeModel homeModel;
  final HomeCategoriesModel homeCategoriesModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          CustomCarouselSliderWidget(homeModel: homeModel),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: ColorsManager.kprimaryColor)),
          ),
           CustomHomeCategoriesListViewWidget(homeCategoriesModel:homeCategoriesModel),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
            child: Text('New Products',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: ColorsManager.kprimaryColor)),
          ),
          ProductsGridViewWidget(homeModel: homeModel)
        ],
      ),
    );
  }
}
