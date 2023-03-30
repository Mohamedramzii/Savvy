import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/app_managers/assets_manager.dart';
import '../../../data/models/cart_model/cart_item.dart';

class CartViewItemWidget extends StatelessWidget {
  const CartViewItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

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
                imageUrl: item.product!.image!,
                width: 140.w,
                height: 130.h,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Lottie.asset(ImagesManager.imageLoading2),
              ),
              if (item.product!.discount != 0)
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
          SizedBox(
            width: 200.w,
            height: 120.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                  Text(
                    item.product!.name!,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // const Spacer(),
                  Row(
                    children: [
                      Text(
                        'EGP ${item.product!.price!.round().toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.green, fontSize: 20),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      if (item.product!.discount != 0)
                        Text(
                          'EGP ${item.product!.oldPrice!.round().toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13),
                        ),
                      const Spacer(),
                      
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
