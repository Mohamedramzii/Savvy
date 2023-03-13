import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/core/app_managers/color_manager.dart';

class CustomhaveAccountWidget extends StatelessWidget {
  const CustomhaveAccountWidget({
    Key? key,
    required this.text,
    required this.toText,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final String toText;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall!,
        ),
        SizedBox(
          width: 3.w,
        ),
        TextButton(
          onPressed: onpressed,
          child: Text(
            toText,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorsManager.kprimaryColor,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
