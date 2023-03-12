import 'package:flutter/material.dart';

import 'package:xstore_cubit/features/onBoarding/data/models/onBoarding_model.dart';

class OnBoardingPageViewItemWidget extends StatelessWidget {
  const OnBoardingPageViewItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final OnBoardingModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(data.image,)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            data.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            data.body,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        )
      ],
    );
  }
}
