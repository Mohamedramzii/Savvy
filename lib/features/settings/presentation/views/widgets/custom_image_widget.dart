import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xstore_cubit/core/app_managers/assets_manager.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';

import '../../../../auth/data/models/login_model.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.data,
    required this.width,
    required this.height,
  }) : super(key: key);
  final LoginModel data;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 's',
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.red,
            border: Border.all(
              color: ColorsManager.kprimaryColor,
            ),
            image: DecorationImage(
                image: CachedNetworkImageProvider(data.userData!.imageurl!))),
      ),
    );
  }
}
