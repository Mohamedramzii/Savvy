import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/features/home/presentation/views/widgets/custom_carousel_widget.dart';
import 'package:xstore_cubit/features/home/presentation/views/widgets/products_gridview_widget.dart';

import '../../data/models/home_model/home_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
    required this.homeModel,
  }) : super(key: key);
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          CustomCarouselSliderWidget(homeModel: homeModel),
          SizedBox(
            height: 10.h,
          ),
          ProductsGridViewWidget(homeModel: homeModel)
        ],
      ),
    );
  }
}
