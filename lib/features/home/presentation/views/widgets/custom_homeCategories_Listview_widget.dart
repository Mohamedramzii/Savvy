import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../categories/data/models/homeCategoriesModel.dart';
import 'custom_homeCategories_widget.dart';

class CustomHomeCategoriesListViewWidget extends StatelessWidget {
  const CustomHomeCategoriesListViewWidget({
    Key? key,
    required this.homeCategoriesModel,
  }) : super(key: key);
  final HomeCategoriesModel homeCategoriesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        height: 120.h,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomHomeCategoriesItem(
                homeCategoriesModel:
                    homeCategoriesModel.data.data[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  width: 5.w,
                ),
            itemCount: homeCategoriesModel.data.data.length),
      ),
    );
  }
}
