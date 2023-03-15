import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/home_model/home_model.dart';
import 'products_gridview_ITEM_widget.dart';

class ProductsGridViewWidget extends StatelessWidget {
  const ProductsGridViewWidget({
    Key? key,
    required this.homeModel,
  }) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 5.w,
      childAspectRatio: 1/1.7,
      children: List.generate(
          homeModel.data!.products!.length,
          (index) => ProductsGridViewItemsWidget(
              homeModel: homeModel, index: index)),
    );
  }
}
